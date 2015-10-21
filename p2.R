library(qcc)
data <- read.csv("/Users/drbh/Desktop/question_two.csv", stringsAsFactors = FALSE)
# summary(data) # QUICK VIEW OF DATA
xbar_chart <- qcc(data, type="xbar.one", std.dev = "SD")
# Plot the process chart
process.capability(xbar_chart, spec.limits = c(.05,.1))
right_answer <- sd(data[[1]]) # ANSWER EXCEL GETS
cat(xbar_chart$std.dev,right_answer)
