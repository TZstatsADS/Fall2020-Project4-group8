# Project 4: Causal Inference Algorithm Implementation and Evaluation

### [Project Description](doc/project4_desc.md)

Term: Fall 2020

+ Team # 8
+ Project title: Causal Inference Algorithm Implementation and Evaluation
+ Team members
	+ Xinying Feng
	+ Mina Jiang
	+ Elise Nguyen
	+ Rohan Uppuluri
	+ Natalie Williams
	+ Tianle Zhu

+ Project summary: This project explores different causal inference algorithms in details through manual implementations in Python and estimation of propensty scores. The algorithms include full matching using three distance metrics Mahalanobis, propensity score and linear propensity score, Inverse Propensity Weighting and Stratification. Through fitting and estmating the propensity scores using two datasets and comparing the estimtaed ATE scores and the true ATE scores and the computer runtime, conclusions of an outperforming algorithm were reached. Details of implementation and evaluation of each algorithm used can be found in the doc folder of the repository, as well as a project report explaning the background and supplementary information regarding each algorithm and metric. Overall, we found that Stratification performed best out of all methods on the low dimensional dataset and the high dimensional dataset both in terms of runtime and absolute error.

+ Installation instructions: 
	+ Make sure you use pip and not conda 
	+ Open Command Prompt, type in ‘pip install rpy2' and 'pip install tabulate'
	+ Change the paths for os.environ in the first block of code to match your R folder directory and version if you get an error message

	
**Contribution statement**: All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

Rohan Uppuluri: worked on implementing full matching using the Mahalanobis, propensity score, and linear propensity score metrics with Elise. Rohan also wrote the explanation of the concept of full matching and the Mahalanobis metric documentation in the main notebook and in the presentation.

Linh Nguyen: found documentation on Full matching function in R and how to use R in Python for Rohan to implement. Implemented full matching using the Mahalanobis, propensity score, and linear propensity score metrics on high dimensional dataset; Compiled Main notebook, added to documentation on full matching, propensity score and linear propensity score in the Main notebook & powerpoint presentation. Put together outline for written report and ppt presentation & installation instructions.  

Natalie Williams: implemented the stratify algorithm and ATE calculation from stratification algorithm.

Tianle Zhu: implemented the inverse propensity weighting algorithm with Xinying Feng and wrote the explanation of IPW in the main file, the report, and PowerPoint.

Mina Jiang: participated in the debugging of the implementation of stratification algorithm; wrote explanation of the stratification algorithm in the report; completed slides on explaining the stratification algorithm and overall algorithm evaluation in the PowerPoint; completed the README file with project summary and explanation for the group.

Xinying Feng: implemented the inverse propensity weighting algorithm with Tianle Zhu and contribute to the calculation of propensity score.


Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
