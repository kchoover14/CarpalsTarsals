
#This is a replication of an analysis done originally in R studio, presented in an open-access academic paper:
#https://peerj.com/articles/5564/

#packages
library(ggplot2)

#load data
require(readxl)
wtshk <- read_excel("/Users/jcberbesque/Desktop/colette/CARTAR/second_draft/Log_ratio_data_wrangle_ii.xlsx")

#ensure variable type
wtshk$Sex <- as.factor(wtshk$Sex)
wtshk$SHK_WT <- as.factor(wtshk$SHK_WT)
wtshk$Bone <- as.factor(wtshk$Bone)

#check
#Shock versus weight figure
p1 <- ggplot(wtshk, aes(Bone, y = Ratio, fill = SHK_WT)) + 
  geom_boxplot(outlier.shape = NA) + 
  scale_fill_grey(start = .6, end = 1.0) + 
  theme_classic() + 
  geom_jitter(position = position_jitter(width = .1, height = 0))

p1 + ggtitle("Weight vs Shock") + xlab("Weight/Shock") + ylab("Ratio (ln L:W)")    


#Load second dataset (with sex)  
#these data are publicly available at:
#https://doi.org/10.6084/m9.figshare.5977375.v3

wtshk_sex <- read_excel("/Users/jcberbesque/Desktop/colette/CARTAR/second_draft/Log_ratio_data_wrangle.xlsx")

#ensure variable type
wtshk_sex$Sex <- as.factor(wtshk_sex$Sex)
wtshk_sex$SHK_WT <- as.factor(wtshk_sex$SHK_WT)
wtshk_sex$Bone_shock <- as.factor(wtshk_sex$Bone_shock)
wtshk_sex$Bone_Weight <- as.factor(wtshk_sex$Bone_Weight)


#Plot shock by bone by sex      
p2 <- ggplot(wtshk_sex, aes(x = Bone_shock, y = SHOCK, fill = Sex)) +
  geom_boxplot(outlier.shape = NA) + 
  scale_fill_grey(start = .6, end = 1.0) + 
  theme_classic() +
  geom_jitter(position = position_jitter(width = .1, height = 0))
 
p2 + ggtitle("Shock Absorbing Bones by Sex") + xlab("Bone") + ylab("Ratio (ln L:W)")


#Plot Weight bones by sex
p3 <- ggplot(wtshk_sex, aes(x = Bone_Weight, y = Ratio, fill = Sex)) + 
  geom_boxplot(outlier.shape = NA) + 
  scale_fill_grey(start = .6, end = 1.0) + 
  theme_classic() +
  geom_jitter(position = position_jitter(width = .1, height = 0))

p3 + ggtitle("Weight") + xlab("Bone") + ylab("Ratio (ln L:W)") 
plot(p3)

#Plot Shock bones by sex
p4 <- ggplot(wtshk_sex, aes(Bone_shock, y = SHOCK, fill = Sex)) + 
  geom_boxplot(outlier.shape = NA) + 
  scale_fill_grey(start = .6, end = 1.0) + 
  theme_classic() + 
  geom_jitter(position = position_jitter(width = .1, height = 0))

p4 + ggtitle("Shock") + xlab("Bone") + ylab("Ratio (ln L:W)")
