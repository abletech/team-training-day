# Setup

```
Load values from input into 'board' memory
Check values are correct / valid for a board
```

# Single Slot Strategy

```
Start strategy of counting single vacant slots in columns, rows and numbers
	Do any of the columns, rows or numbers have 1 vacant slots?
	If any of the above match, work through them to solve the vacant slots.
		Flag true
	Else
		Flag false
	If Flag true, loop Single Slot Strategy
```

# Double Slot Strategy

```
Start strategy of counting double vacant slots in columns, rows and numbers
	Do any of the columns, rows or numbers have 2 vacant slots?
	If any of the above match, work through them to solve the vacant slots by cross-checking. e.g. if a row, then compare each slot with it's appropriate column.
		Flag true
	Else
		Flag false
	If Flag true, go to Single Slot Strategy
```

# Effect (X, Y, Number)

```
Everytime a slot is filled, check how that solution affects a row, column, board portion and number.
```