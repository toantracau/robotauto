*** Settings ***
Resource          ../CONFIG/MAIN-RESOURCE.robot
Library           Collections

*** variable ***
######################### TC1 #######################
${home-moretravel-button}    xpath://div[text()='More travel']/..
${moretravel-button-flight}    xpath://a[@href='/Flights']
${element-leavingform}    xpath://label[text()='Leaving from']/..
${element-goingto}    xpath://label[text()='Going to']/..
${element-leaving-choose}    xpath://strong[text()='Hanoi (HAN - Noi Bai Intl.)']
${element-goingto-choose}    xpath://strong[text()='Ho Chi Minh City (SGN - Tan Son Nhat Intl.)']
${input-leavingfrom}    xpath://input[@id='location-field-leg1-origin']
${input-goingto}    xpath://input[@id='location-field-leg1-destination']
${button-departing}    xpath://button[@id='d1-btn']
${button-returning}    xpath://button[@data-name='endDate']
${input-departing}    xpath://input[@name='startDate']
${input-returning}    xpath://input[@name='endDate']
${button-search}    xpath://button[@data-testid='submit-button']
###########expected result###############
@{list-result}    Get WebElements    xpath://ul[@data-test-id='listings']
${button-result}    xpath://button[@data-test-id='select-link']
${value-check}    xpath://li//div[text()='Hanoi (HAN) - Ho Chi... (SGN)']
############################################
###################### TC2 ################
${element-going-choose-dn}    xpath://strong[text()='Da Nang (DAD - Da Nang Intl.)']
##################### TC3#################
${element-select-sort}    xpath://select[@data-test-id='sortDropdown']
#Get matching xpath count
