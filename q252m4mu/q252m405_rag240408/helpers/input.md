
# This is the Title

Body text below the title.

## Level 1 Header 1

Here is some text located above two clearly separate tables, which are however positioned
with some vertical overlap.

This serves as a check for the fidelity of how this page’s content is reproduced as a
**Markdown** formatted file. We are also capable of outputting _italic_ and **_bold-italic_** text!

### Level 2 Header 1

Text under header 1 of level 2.




|1|2|3|
|---|---|---|
|4|5|6|
|7|8|9|

|Column1|Column2|
|---|---|
|Cell (0, 0)|Cell (0, 1)|
|Cell (1, 0)|Cell (1, 1)|
|Cell (2, 0)|Cell (2, 1)|






This is some text **below** both tables. It serves as a check how standard text is being
resumed after the output of the above tables.

Let’s try the output of an ordered list:

 1. Item A
 2. Item B
 3. Item C

And now an unordered list:

 *  Item 1
 *  Item 2
 *  Item 3
 *  Item 4


### Level 2 Header 2

Finally some program code for entertainment:

```
import fitz 

doc = fitz.open(filename) 

for page in doc: 

    print(page.get_text()) 

doc.close() 
```


This text appears below the code snippet. What happens with `inline code` pieces?



-----

