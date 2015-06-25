# Data structures

```
board = [
	[ # row 1
		{
			value: 9,
			type: pre-filled | vacant
			status: filled | vacant | guessed
			guesses: []
		}
		... (* 9)
	]
	... (* 9)
]
```

v.s.

```
[
	{
		value: 9,
		type: pre-filled | vacant
		status: filled | vacant | guessed
		guesses: []
	}
	... (* 81)
]
```

We could also take the input and split it up into three memory spaces:

```
boardByColumns = [
	[ # column 1
		{},
		...  # * 9 values
	]
]

boardByRows = [
	[ # row 1
		{},
		...  # * 9 values
	]
]

boardByBoardPortions = [
	[ # Board portions
		{},
		...  # * 9 values
	]
]
```