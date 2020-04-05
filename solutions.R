library(data.table)
all_data <- read.table(".\\Data\\getdata_data_ss06hid.csv",sep = ",", header = TRUE)
x <- data.table(all_data)
class(x)
nrow(x[VAL == '24',])

library(openxlsx)
dat1 <- read.xlsx(".\\Data\\getdata_data_DATA.gov_NGAP.xlsx",)
dat2 <- dat1[15:20,1:15]
dat <- dat2[2:6,1:15]
colnames(dat)<-as.character(dat2[1,])
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
fileURL <- ".\\Data\\getdata_data_restaurants.xml"
doc <- xmlTreeParse(fileURL,useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
all_zip <- xpathSApply(rootNode,"//zipcode",xmlValue)
all_zip_valid <- all_zip[all_zip=="21231"]
length(all_zip_valid)

fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
x <- download.file(fileURL,".\\Data\\downloadedFile.csv")
DT <- fread(".\\Data\\downloadedFile.csv",sep=",",header = TRUE)
DT[,mean(pwgtp15),by=SEX]

