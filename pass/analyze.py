import argparse
from collections import Counter
from itertools import islice


def read_trace(path):
    ids, names = [], {}
    with open(path) as f:
        for line in f:
            ids.append(names.setdefault(line.rstrip("\n"), len(names)))
    return ids, {i: name for name, i in names.items()}


def windows(ids, n):
    return zip(*(islice(ids, k, None) for k in range(n)))


parser = argparse.ArgumentParser(description="Frequent 'User <- Operand' patterns in a trace")
parser.add_argument("trace", help="trace file, one 'user <- operand' per line")
parser.add_argument("--max-window", type=int, default=5)
parser.add_argument("--top", type=int, default=15)
args = parser.parse_args()

ids, names = read_trace(args.trace)
print(f"Trace: {args.trace}")
print(f"Uses: {len(ids)}, distinct 'User <- Operand' pairs: {len(names)}\n")

for n in range(1, args.max_window + 1):
    counts = Counter(windows(ids, n))
    total = len(ids) - n + 1
    top = counts.most_common(args.top)
    covered = sum(c for _, c in top)
    print(f"== Window {n}: {len(counts)} distinct patterns, "
            f"top {len(top)} cover {100 * covered / total:.2f}% ==")
    for pattern, c in top:
        print(f"{c:>10} {100 * c / total:6.2f}%  " + " | ".join(names[i] for i in pattern))
    print()
