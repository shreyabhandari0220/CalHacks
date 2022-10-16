# Instafit
# Inspiration
Instafit was created due to a gap in the current iOS Health and Google Health apps. While they provide health information, they lack any evaluation of the data for the user to actively take measures and more importantly be encouraged to take any measures. Instafit fills the gaps by providing users (the general population) with a real time evaluation of their health risks based on their health patterns (from the iOS Health or Google Health apps) and also leverages cryptocurrency as an incentive for exercising.
# What it does
Instafit provides users (the general population) with a real time evaluation of health risks associated with their current health patterns. It also provides suggestions to improve their health and cryptocurrency as an incentive for exercising.

# How we built it
We leveraged Supervised Machine Learning techniques and statistical correlation of particular LOINC values from the InterSystems FHIR server to predictively model risk assessment. Additionally, through the use of Python, Jupyter Notebooks, Dart, and Flutter we created the the mobile app with the different elements.

# Challenges we ran into
As the majority of us are beginners, we struggled on implementing an app for mobile devices using Flutter. Additionally, we struggled in getting risk assessment values based on individual’s health data. After much challenge, we learned about the InterSystems FHIR server, which we utilized to predictively model risk assessment.
