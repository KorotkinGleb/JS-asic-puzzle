"""Check whether the recovered 11x11 Two Stars solution is unique.

The solver uses the recovered rules directly:

* exactly two stars in every row;
* exactly two stars in every column;
* exactly two stars in every irregular region;
* no horizontal, vertical, or diagonal adjacency.

Counting is capped at two because that is sufficient to decide uniqueness.
"""

from __future__ import annotations

from functools import lru_cache
from itertools import combinations


SIZE = 11
REGION_ROWS = (
    "GGGGGCCFEEA",
    "GGHGGCFFEEA",
    "GGHCCCCFFEA",
    "GGHCKKKAFFA",
    "HGHCKAAAAAA",
    "HHHCKKKAJJJ",
    "CCCCCCKAJBB",
    "CDDDKKKAJBB",
    "CDDIAAAAJBB",
    "CCDIIAAAJJJ",
    "CDDIAAAAAAA",
)
REGION_NAMES = tuple("ABCDEFGHIJK")
REGION_INDEX = {name: index for index, name in enumerate(REGION_NAMES)}

KNOWN_SOLUTION = (
    "00000001010",
    "10000100000",
    "00000001010",
    "10100000000",
    "00001010000",
    "00100000100",
    "00001000001",
    "01000010000",
    "00010000001",
    "00000100100",
    "01010000000",
)


def row_masks() -> tuple[int, ...]:
    """All ways to place two horizontally nonadjacent stars in one row."""

    return tuple(
        (1 << first) | (1 << second)
        for first, second in combinations(range(SIZE), 2)
        if second > first + 1
    )


ROW_MASKS = row_masks()


def region_delta(row: int, mask: int) -> tuple[int, ...]:
    counts = [0] * SIZE
    for column in range(SIZE):
        if mask & (1 << column):
            counts[REGION_INDEX[REGION_ROWS[row][column]]] += 1
    return tuple(counts)


ROW_REGION_DELTAS = tuple(
    {
        mask: region_delta(row, mask)
        for mask in ROW_MASKS
    }
    for row in range(SIZE)
)


# Number of cells still available in each region from ``next_row`` onward.
FUTURE_REGION_CELLS = []
for next_row in range(SIZE + 1):
    remaining = [0] * SIZE
    for row in range(next_row, SIZE):
        for region in REGION_ROWS[row]:
            remaining[REGION_INDEX[region]] += 1
    FUTURE_REGION_CELLS.append(tuple(remaining))
FUTURE_REGION_CELLS = tuple(FUTURE_REGION_CELLS)


def next_states(
    row: int,
    previous_mask: int,
    column_counts: tuple[int, ...],
    region_counts: tuple[int, ...],
):
    forbidden = previous_mask | (previous_mask << 1) | (previous_mask >> 1)

    for mask in ROW_MASKS:
        if mask & forbidden:
            continue

        new_columns = list(column_counts)
        valid = True
        for column in range(SIZE):
            if mask & (1 << column):
                new_columns[column] += 1
                if new_columns[column] > 2:
                    valid = False
                    break
        if not valid:
            continue

        next_row = row + 1
        remaining_rows = SIZE - next_row
        if any(count + remaining_rows < 2 for count in new_columns):
            continue

        delta = ROW_REGION_DELTAS[row][mask]
        new_regions = tuple(
            region_counts[index] + delta[index]
            for index in range(SIZE)
        )
        if any(count > 2 for count in new_regions):
            continue
        if any(
            new_regions[index] + FUTURE_REGION_CELLS[next_row][index] < 2
            for index in range(SIZE)
        ):
            continue

        yield mask, tuple(new_columns), new_regions


@lru_cache(maxsize=None)
def count_solutions(
    row: int,
    previous_mask: int,
    column_counts: tuple[int, ...],
    region_counts: tuple[int, ...],
) -> int:
    """Return 0, 1, or 2, where 2 means two or more solutions."""

    if row == SIZE:
        return int(
            all(count == 2 for count in column_counts)
            and all(count == 2 for count in region_counts)
        )

    total = 0
    for mask, new_columns, new_regions in next_states(
        row, previous_mask, column_counts, region_counts
    ):
        total += count_solutions(
            row + 1,
            mask,
            new_columns,
            new_regions,
        )
        if total >= 2:
            return 2
    return total


def collect_solutions(limit: int = 2) -> list[tuple[int, ...]]:
    solutions: list[tuple[int, ...]] = []
    zeros = (0,) * SIZE

    def visit(
        row: int,
        previous_mask: int,
        column_counts: tuple[int, ...],
        region_counts: tuple[int, ...],
        prefix: tuple[int, ...],
    ) -> None:
        if len(solutions) >= limit:
            return
        if row == SIZE:
            solutions.append(prefix)
            return

        for mask, new_columns, new_regions in next_states(
            row, previous_mask, column_counts, region_counts
        ):
            if count_solutions(
                row + 1, mask, new_columns, new_regions
            ) == 0:
                continue
            visit(
                row + 1,
                mask,
                new_columns,
                new_regions,
                prefix + (mask,),
            )
            if len(solutions) >= limit:
                return

    visit(0, 0, zeros, zeros, ())
    return solutions


def solution_rows(solution: tuple[int, ...]) -> tuple[str, ...]:
    return tuple(
        "".join(
            "1" if mask & (1 << column) else "0"
            for column in range(SIZE)
        )
        for mask in solution
    )


def print_solution(index: int, solution: tuple[int, ...]) -> None:
    print(f"solution {index}:")
    for row, bits in enumerate(solution_rows(solution)):
        print(f"  {row:2}: {bits}")


def main() -> None:
    zeros = (0,) * SIZE
    count = count_solutions(0, 0, zeros, zeros)
    solutions = collect_solutions(2)

    if count == 0:
        print("UNSAT: no valid matrix")
        return

    for index, solution in enumerate(solutions, start=1):
        print_solution(index, solution)

    known_present = any(
        solution_rows(solution) == KNOWN_SOLUTION
        for solution in solutions
    )
    print(f"known solution among first two: {known_present}")

    if count == 1:
        print("UNIQUE: exactly one valid matrix")
    else:
        print("NOT UNIQUE: at least two valid matrices")


if __name__ == "__main__":
    main()
