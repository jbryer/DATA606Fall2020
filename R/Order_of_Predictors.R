lm1 <- lm(poverty ~ female_house + white, data=poverty)
summary(lm1)
anova(lm1)
132.57 + 8.21

lm2 <- lm(poverty ~ white + female_house, data=poverty)
summary(lm2)
anova(lm2)
45.71 + 95.06

lm3 <- lm(poverty ~ female_house, data = poverty)
summary(lm3)

lm4 <- lm(poverty ~ white, data = poverty)
summary(lm4)

lm5 <- lm(poverty ~ white * female_house, data = poverty)
summary(lm5)

lm5 <- lm(poverty ~ white : female_house, data = poverty)
summary(lm5)
