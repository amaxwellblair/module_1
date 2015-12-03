Night Writer
============

Process
---------
1. How will you know the problem is solved?

- The function can translate braille to english and english to braille

2. How will it be used?

- To translate braille to english and vice versa on the terminal

3. What is the most trivial use case?

- Nothing

4. What is the minimum work case?

- A single letter

5. What is the next most complex case?

- A word
- A sentence
- Capital letters and lower case letters
- Numbers

6. Pseudocode

*Writer*

Input file extensions on terminal

$ writer.rb english.txt braille.txt

file = english.txt

characters = break down file into words then characters

convert character to symbol and grab braille via hash

then store grabbed braille into an array

write array into to braille.txt

*Reader*

Input file extensions on terminal

$ reader.rb braille.txt english.txt

file = braille.txt

put each column of braille into an array within an array

convert braille into binary

then use binary to find letters in a hash

then store grabbed letters into an array

write array into to english.txt

7.
