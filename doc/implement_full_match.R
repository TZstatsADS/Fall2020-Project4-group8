library(optmatch)
library(flexclust)
library(dplyr)

#method 2: propensity scores
lowDim_dataset <- read.csv('/Users/rohan/Documents/applied_ds/Fall2020-Project4-group-8/data/lowDim_dataset.csv')
prop_scores<-read.csv('/Users/rohan/Documents/applied_ds/Fall2020-Project4-group-8/output/low_dim_propensity_scores.csv')$propensity_scores
lowDim_dataset$scores=prop_scores

fv=fullmatch(match_on(A~scores,data=lowDim_dataset,method='euclidean'),data=lowDim_dataset)

#make group assignment be a column
lowDim_dataset$assign = as.numeric(fv)

#example group
(lowDim_dataset%>%filter(assign==77)%>%select(Y,A,assign,scores))

#if this doesn't print anything then that means each group has at least one control and at least one treatment
for (i in 1:length(levels(fv)))
{
  temp = lowDim_dataset%>%select(Y,A,assign,scores)%>%filter(assign==i)
  grouping = temp$A
  if (sum(grouping)==0 |sum(grouping)==length(grouping))
  {
    print(i)
  }
}

#compute ATE
ATE_vec<-rep(NA,length(levels(fv)))
weights<-rep(NA,length(levels(fv)))

for(i in 1:length(levels(fv)))
{
  treatment_Y = (lowDim_dataset%>%filter(assign==i)%>%filter(A==1))$Y
  control_Y = (lowDim_dataset%>%filter(assign==i)%>%filter(A==0))$Y
  
  ATE_vec[i] = mean(treatment_Y)-mean(control_Y)
  weights[i]<-length((lowDim_dataset%>%filter(assign==i))$Y)
  
}

propensity_est_ATE<-weighted.mean(ATE_vec,weights)




#method 1: mahalanobis
lowDim_dataset_2 <- read.csv('/Users/rohan/Documents/applied_ds/Fall2020-Project4-group-8/data/lowDim_dataset.csv')
fvm = fullmatch(match_on(A~.-Y,data=lowDim_dataset_2,method='mahalanobis'),data=lowDim_dataset_2)
lowDim_dataset_2$assign = as.numeric(fvm)
(lowDim_dataset_2%>%filter(assign==77)%>%select(Y,A,assign))

#if this doesn't print anything then that means each group has at least one control and at least one treatment
for (i in 1:length(levels(fvm)))
{
  temp = lowDim_dataset_2%>%select(Y,A,assign)%>%filter(assign==i)
  grouping = temp$A
  if (sum(grouping)==0 |sum(grouping)==length(grouping)) #if everything in the group is either all control or all treatment
  {
    print(i)
  }
}

#compute ATE
ATE_vec<-rep(NA,length(levels(fvm)))
weights<-rep(NA,length(levels(fvm)))

for(i in 1:length(levels(fvm)))
{
  treatment_Y = (lowDim_dataset_2%>%filter(assign==i)%>%filter(A==1))$Y
  control_Y = (lowDim_dataset_2%>%filter(assign==i)%>%filter(A==0))$Y
  
  ATE_vec[i] = mean(treatment_Y)-mean(control_Y)
  weights[i]<-length((lowDim_dataset_2%>%filter(assign==i))$Y)
  
}

mahalanobis_est_ATE<-weighted.mean(ATE_vec,weights)




#method 3: linear propensity score
lowDim_dataset_3 <- read.csv('/Users/rohan/Documents/applied_ds/Fall2020-Project4-group-8/data/lowDim_dataset.csv')
prop_scores<-read.csv('/Users/rohan/Documents/applied_ds/Fall2020-Project4-group-8/output/low_dim_propensity_scores.csv')$propensity_scores
lin_prop_scores<-log(prop_scores/(1-prop_scores))
lowDim_dataset_3$scores=lin_prop_scores

fvl=fullmatch(match_on(A~scores,data=lowDim_dataset_3,method='euclidean'),data=lowDim_dataset_3)

#make group assignment be a column
lowDim_dataset_3$assign = as.numeric(fvl)

#example group
(lowDim_dataset_3%>%filter(assign==77)%>%select(Y,A,assign,scores))

#if this doesn't print anything then that means each group has at least one control and at least one treatment
for (i in 1:length(levels(fvl)))
{
  temp = lowDim_dataset_3%>%select(Y,A,assign,scores)%>%filter(assign==i)
  grouping = temp$A
  if (sum(grouping)==0 |sum(grouping)==length(grouping))
  {
    print(i)
  }
}

#compute ATE
ATE_vec<-rep(NA,length(levels(fvl)))
weights<-rep(NA,length(levels(fvl)))

for(i in 1:length(levels(fvl)))
{
  treatment_Y = (lowDim_dataset_3%>%filter(assign==i)%>%filter(A==1))$Y
  control_Y = (lowDim_dataset_3%>%filter(assign==i)%>%filter(A==0))$Y
  
  ATE_vec[i] = mean(treatment_Y)-mean(control_Y)
  weights[i]<-length((lowDim_dataset_3%>%filter(assign==i))$Y)
  
}

linear_propensity_est_ATE<-weighted.mean(ATE_vec,weights)
