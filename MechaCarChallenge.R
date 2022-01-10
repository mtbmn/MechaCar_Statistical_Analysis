library(dplyr)

# Deliverable 1:
mechaCarData <- read.csv('MechaCar_mpg.csv')

mpgModel <- lm(mpg ~ vehicle_length + vehicle_weight +
                 spoiler_angle + ground_clearance + AWD, mechaCarData)

summary(mpgModel)


# Deliverable 2
coilData <- read.csv('Suspension_Coil.csv')

total_summary <- summarize(coilData, Mean = mean(PSI),
                           Median = median(PSI),
                           Variance = var(PSI),
                           SD = sd(PSI))

lot_summary <- coilData %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI),
            Median = median(PSI),
            Variance = var(PSI),
            SD = sd(PSI), .groups = 'keep')

# Deliverable 3
## All data
t.test(coilData$PSI, mu = 1500)

## By lot
t.test(subset(coilData, Manufacturing_Lot == 'Lot1', PSI), mu = 1500)
t.test(subset(coilData, Manufacturing_Lot == 'Lot2', PSI), mu = 1500)
t.test(subset(coilData, Manufacturing_Lot == 'Lot3', PSI), mu = 1500)