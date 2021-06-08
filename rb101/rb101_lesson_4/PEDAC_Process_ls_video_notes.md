## My Transcript of Launch School Video 

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
##  D:  Data Structures
##  A:  Algorithms
##  C:  Code a solution

-----------------------

##  Sum Even Number Rows

Imagine a sequence of consecutive even integers begining with 2.  The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on.  Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

**Restated problem**
- Sequence of integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped into rows
- Each row incrementally largers: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Inputs: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row indentified by the input integer
  
