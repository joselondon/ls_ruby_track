## Notestranscript of Launch School Video covering PEDAC

# The PEDAC Process

##  P: Understanding the Problem

- Establish the rules/ define the boundaries of the problem
  - Restate explicit information
  - Identify implicit requirements
- Spend enough time.  Don't rush this step

**General Example**

Given a string, produce a new string with every other word removed.

- Explicit requirments:
  - Input: string
  - Output: new string
  - Remove every other word from input string <br><br>

- Questions:
  - What do we mean by every other word? - odds?, evens?, some other
    definition of  'other'?
  - How are words delimited in this context?
    - Words are delimited by spaces

##  E:  Examples and Test Cases

- Can confirm/ refute assumptions
- Help to answer questions about implicit requirements
- Act as assertions which help to codify the rules and boundaries

##  D:  Data Structures

- Help to reason with data logically
- Help interact with data at implementation level
- Thinking in terms of data structures is part of problem solving    process
- Data structures closely linked to algorithm
  - Set of steps from input to output
  - Involves structuring data in a certain way



##  A:  Algorithms
##  C:  Code a solution

-----------------------

##  Sum Even Number Rows

Imagine a sequence of consecutive even integers begining with 2.  The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on.  Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

**Rules/ requirements**
- Sequence of even integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped into rows
- Each row incrementally largers: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Inputs: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row indentified by the input integer<br><br>

 -  Sequence:
 2, 4, 6, 8, 10, 12, 16, 18, 20 ...

 2
 4, 6
 8, 10, 12
 14, 16, 18, 20
 ....

- How do we create the structure?

**Examples**

row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

Testing our asumptions of the row structures (above) we see that this works:-

 2  --> 2
 4, 6 --> 10

 14, 16, 18, 20 --> 68

 **Data Structures**

 2
 4, 6
 8, 10, 12
 14, 16, 18, 20
 ....

 -  Overall structure represents a sequence as a whole
 -  Individual rows within overall structure
 -  Individual rows in a set order in context of sequence
 -  Individual rowscontain integers
 -  Can assume that integers are in a set order in the context of the sequence

 [
   [2],
   [4, 6],
   [8, 10, 12],
   [14, 16, 18, 20],
   ....
 ]


