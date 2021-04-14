*** Settings ***
Resource          ../CONFIG/MAIN-RESOURCE.robot
Library           Collections

*** variables ***
${button-flights}    //li[@data-test-id='offer-listing']    #//button[@class="uitk-card-link"]
${element}        //span[contains(text(),"from Hanoi") and contains(text(),"in Ho Chi Minh")]
${check1}         from Hanoi
${check2}         in Ho Chi Minh City
${check3}         Da Nang
${button-price}    //div[@class="uitk-flex uitk-flex-nowrap"]
${price}          //span[@class="uitk-lockup-price"]
${element-drc}    //div[@data-test-id='journey-duration']
@{ROBOTS}         Bender2    Bender2    Bender2    Bender2    #Johnny5    Terminator    Robocop
${t}              Bender2    #Johnny5    Terminator    Robocop

*** Test Cases ***
TC1
    open browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    2
    click button    ${home-moretravel-button}
    sleep    2
    Wait Until Element Is Visible    ${moretravel-button-flight}
    click element    ${moretravel-button-flight}
    #### expected result ####
    Page Should Contain Element    xpath://h1[text()='Search flights']
    #########################
    click element    ${element-leavingform}
    sleep    2
    input text    ${input-leavingfrom}    Hanoi
    sleep    2
    click element    ${element-leaving-choose}
    sleep    2
    click element    ${element-goingto}
    sleep    2
    input text    ${input-goingto}    Ho Chi Minh
    sleep    2
    click element    ${element-goingto-choose}
    sleep    2
    Wait Until Element Is Visible    ${button-departing}
    click button    ${button-departing}
    sleep    5
    ${date1}=    Get Current Date    result_format=%b %d
    ${date2}=    Replace String Using Regexp    ${date1}    0    ${EMPTY}
    click button    xpath://button[contains(@aria-label,'${date2}')]
    sleep    3
    click button    xpath://button[@data-stid='apply-date-picker']
    sleep    5
    Wait Until Element Is Visible    ${button-returning}    timeout=10
    click button    ${button-returning}
    sleep    3
    ${date3}=    Get Current Date    result_format=%b %d    increment=+1 day
    #${date3}=    Replace String Using Regexp    ${date3}    0    ${EMPTY}
    click button    xpath://button[contains(@aria-label,'${date3}')]
    Sleep    5
    click button    xpath://button[@data-stid='apply-date-picker']
    sleep    3
    click button    ${button-search}
    Sleep    5
    result-hn-hcm
    sleep    2
    close browser

TC2
    [Tags]    TC2
    open browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    5
    click button    ${home-moretravel-button}
    sleep    5
    Wait Until Element Is Visible    ${moretravel-button-flight}
    click element    ${moretravel-button-flight}
    #### expected result ####
    Page Should Contain Element    xpath://h1[text()='Search flights']
    #########################
    click element    ${element-leavingform}
    sleep    2
    input text    ${input-leavingfrom}    Hanoi
    sleep    3
    click element    ${element-leaving-choose}
    sleep    3
    click element    ${element-goingto}
    sleep    3
    input text    ${input-goingto}    Da Nang
    sleep    3
    click element    ${element-going-choose-dn}
    click button    ${button-search}
    sleep    3
    Scroll Page To Location    0    2000
    sleep    10
    #click button    xpath://button[@data-test-id='show-more-button']
    sortlow
    close browser

TC3
    open browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    3
    click button    ${home-moretravel-button}
    sleep    3
    click element    ${moretravel-button-flight}
    click element    ${element-leavingform}
    sleep    2
    input text    ${input-leavingfrom}    Hanoi
    sleep    3
    click element    ${element-leaving-choose}
    sleep    3
    click element    ${element-goingto}
    sleep    3
    input text    ${input-goingto}    Da Nang
    sleep    3
    click element    ${element-going-choose-dn}
    click button    ${button-search}
    Sleep    3
    result-hn-dn
    sleep    5
    click element    ${element-select-sort}
    select from list by value    ${element-select-sort}    PRICE_DECREASING
    sleep    3
    Scroll Page To Location    0    2000
    sleep    10
    #click button    xpath://button[@data-test-id='show-more-button']
    sleep    5
    sorthight
    close browser

TC4
    open browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    2
    click button    ${home-moretravel-button}
    sleep    2
    click element    ${moretravel-button-flight}
    click element    ${element-leavingform}
    sleep    2
    input text    ${input-leavingfrom}    Hanoi
    sleep    3
    click element    ${element-leaving-choose}
    sleep    3
    click element    ${element-goingto}
    sleep    3
    input text    ${input-goingto}    Da Nang
    sleep    3
    click element    ${element-going-choose-dn}
    click button    ${button-search}
    Sleep    3
    result-hn-dn
    sleep    5
    click element    ${element-select-sort}
    select from list by value    ${element-select-sort}    DURATION_INCREASING
    sleep    3
    shortdura
    close browser

TC5
    open browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    3
    click button    ${home-moretravel-button}
    sleep    3
    Wait Until Element Is Visible    ${moretravel-button-flight}
    click element    ${moretravel-button-flight}
    click element    ${element-leavingform}
    sleep    2
    input text    ${input-leavingfrom}    Hanoi
    sleep    3
    click element    ${element-leaving-choose}
    sleep    3
    click element    ${element-goingto}
    sleep    3
    input text    ${input-goingto}    Da Nang
    sleep    3
    click element    ${element-going-choose-dn}
    click button    ${button-search}
    Sleep    3
    result-hn-dn
    sleep    20
    click element    ${element-select-sort}
    select from list by value    ${element-select-sort}    DURATION_DECREASING
    sleep    3
    longdura
    close browser

tc6
    ${index}=    Set Variable    1
    FOR    ${robot}    IN    @{ROBOTS}
        Exit For Loop IF    ${index} > 2
        Log    ${robot}
        ${index}=    Evaluate    ${index} + 1
    END
    FOR    ${robot}    IN    @{ROBOTS}
        Log    ${robot}
        ${index}=    Evaluate    ${index} + 1
        Should be true    "${t}"=="${robot}"
    END

TC7
    open browser    http://pdu.edu.vn/cntt/    Chrome
    page should contain element    //a[@href='http://pdu.edu.vn.com/cntt/']

*** keyword ***
result-hn-hcm
    ${elements}=    Get WebElements    ${button-flights}
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Element Should Contain    ${element}    ${check1}
        Element Should Contain    ${element}    ${check2}
    END
    Log to Console    ${elements}

result-hn-dn
    ${elements}=    Get WebElements    ${button-flights}
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Element Should Contain    ${element}    ${check1}
        Element Should Contain    ${element}    ${check3}
    END
    Log to Console    ${elements}

sortlow
    ${count}    Set Variable    ${0}
    ${list-elements}=    Get WebElements    ${price}
    FOR    ${n}    IN    @{list-elements}
        #${count}=    Set Variable    ${n}
        ${text}=    Get Text    ${n}
        ${text}=    Remove String    ${text}    $
        ${text}=    Set Variable    ${text}+1
        Run Keyword IF    ${count} > 0    Run keywords    log to console    =====start=========
        ...    AND    log to console    Qua Khu
        ...    AND    log to console    ${history}
        ...    AND    log to console    hien tai
        ...    AND    log to console    ${text}
        ...    AND    log to console    =====end=========
        ...    AND    Should Be True    ${history} <= ${text}
        ${history}=    Set Variable    ${text}
        ${count}    Set Variable    1
    END

sorthight
    ${count}    Set Variable    ${0}
    ${list-elements}=    Get WebElements    ${price}
    FOR    ${n}    IN    @{list-elements}
        #${count}=    Set Variable    ${n}
        ${text}=    Get Text    ${n}
        ${text}=    Remove String    ${text}    $
        ${text}=    Set Variable    ${text}+1
        Run Keyword IF    ${count} > 0    Run keywords    log to console    =====start=========
        ...    AND    log to console    Qua Khu
        ...    AND    log to console    ${history}
        ...    AND    log to console    hien tai
        ...    AND    log to console    ${text}
        ...    AND    log to console    =====end=========
        ...    AND    Should Be True    ${history} >= ${text}
        ${history}=    Set Variable    ${text}
        ${count}    Set Variable    1
    END

longdura
    ${elements}=    Get WebElements    ${element-drc}
    ${count}    Set variable    ${0}
    FOR    ${n}    IN    @{elements}
        ${text}=    Get Text    ${n}
        ${text}=    Remove String    ${text}    m    (Nonstop)    (1 stop)    ${SPACE}
        ${text1}=    Fetch From Right    ${text}    h
        ${text2}=    Fetch From Left    ${text}    h
        Run keyword IF    ${count}>0    Run keywords    log to console    =====start=========
        ...    AND    log to console    =========================
        ...    AND    log to console    Gio
        ...    AND    log to console    ${text2}
        ...    AND    log to console    Phut
        ...    AND    log to console    ${oldminute}
        ...    AND    log to console    ==========End===========
        ...    AND    Should Be True    ${oldhour} >= ${text2}
        ...    AND    Run Keyword IF    ${oldhour} == ${text2}    BuiltIn.Should Be True    ${oldminute}>=${text1}
        ${oldminute}=    Set Variable    ${text1}
        ${oldhour}=    Set Variable    ${text2}
        ${count}    Set Variable    1
    END

shortdura
    ${elements}=    Get WebElements    ${element-drc}
    ${count}    Set variable    ${0}
    FOR    ${n}    IN    @{elements}
        ${text}=    Get Text    ${n}
        ${text}=    Remove String    ${text}    m    (Nonstop)    (1 stop)    ${SPACE}
        ${text1}=    Fetch From Right    ${text}    h
        ${text2}=    Fetch From Left    ${text}    h
        Run keyword IF    ${count}>0    Run keywords    log to console    =====start=========
        ...    AND    log to console    =========================
        ...    AND    log to console    Gio
        ...    AND    log to console    ${text2}
        ...    AND    log to console    Phut
        ...    AND    log to console    ${oldminute}
        ...    AND    log to console    ==========End===========
        ...    AND    Should Be True    ${oldhour} <= ${text2}
        ...    AND    Run Keyword IF    ${oldhour} == ${text2}    BuiltIn.Should Be True    ${oldminute}<=${text1}
        ${oldminute}=    Set Variable    ${text1}
        ${oldhour}=    Set Variable    ${text2}
        ${count}    Set Variable    1
    END

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
