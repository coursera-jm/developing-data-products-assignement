---
title       : Coursera Assignment 2
subtitle    : June 23, 2014
author      : Jean M.
job         : Student
framework   : io2012   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets    : [bootstrap, quiz, shiny, interactive]
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## Introduction



--- .class #id 

## Slide 1


---  &radio
## R Base - 1

What is the base R function or operator that concatenate 2 character vectors?

1. +
2. _paste_
3. glue
4. stick
5. concatenate

*** .hint 
tooth

*** .explanation 
cpaste("abc","qwe",sep="")

--- &interactive
## Interactive Console

<textarea class='interactive' id='interactive{{slide.num}}' data-cell='{{slide.num}}' data-results='asis' style='display:none'>require(googleVis)
M1 <- gvisMotionChart(Fruits, idvar = 'Fruit', timevar = 'Year')
print(M1, tag = 'chart')</textarea>

--- &interactive
## Interactive Controls
<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label class="control-label" for="sex">Choose Sex</label>
      <select id="sex">
        <option value="Male" selected="selected">Male</option>
        <option value="Female">Female</option>
      </select>
      <script type="application/json" data-for="sex" data-nonempty="">{}</script>
      <label class="control-label" for="type">Choose Type</label>
      <select id="type">
        <option value="multiBarChart" selected="selected">multiBarChart</option>
        <option value="multiBarHorizontalChart">multiBarHorizontalChart</option>
      </select>
      <script type="application/json" data-for="type" data-nonempty="">{}</script>
    </form>
  </div>
  <div class="span8">
    <div id="nvd3plot" class="shiny-html-output nvd3 rChart"></div>
  </div>
</div>
