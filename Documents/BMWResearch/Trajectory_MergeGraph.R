# Author: Rebecca Kahn
# Date: Spring 2021
# Purpose: Graph of Trajectory vs Merge Status

rm(list = ls())
library(ggplot2)

data <- read.csv("tp1618317296.csv")
dim(data)
data <- na.omit(data)
dim(data)
data <- data[0:750,]

attach(data)

# Rotated X Point: X-Coord * COS(2PI - Bearing) - Z-Coord * SIN(2PI - Bearing)
# Rotated Y Point: X-Coord * SIN(2PI - Bearing) + Z-Coord * COS(2PI - Bearing)

newX <- data$X.Coord * cos(2*pi - data$Bearing) - data$Y.Coord * sin(2*pi - data$Bearing)
newY <- data$X.Coord * sin(2*pi - data$Bearing) + data$Y.Coord * cos(2*pi - data$Bearing)

trajecX <- rbind(newX, newY)

ggplot(data, aes(x=newX, y=newY, color=as.factor(Current.State))) + geom_point() + scale_color_manual(breaks = c("0", "1", "2"), values=c("#999999", "#E69F00", "#56B4E9"))

