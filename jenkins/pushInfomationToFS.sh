#!/bin/bash
cotent=`curl -u weijian:123123123 ${BUILD_URL}api/json`

userStr="userName"
userName =""
if [[ $cotent =~ $userStr ]];then
 value=`echo $cotent | sed 's/.*"userName":\([^,}]*\).*/\1/'`
 userName=`echo $value | sed 's/\"//g'`
fi

sonarStr="sonarqubeDashboardUrl"
sonarqubeDashboardUrl=""
if [[ $cotent =~ $sonarStr ]];then
 value=`echo $cotent | sed 's/.*"sonarqubeDashboardUrl":\([^,}]*\).*/\1/'`
 sonarqubeDashboardUrl=`echo $value | sed 's/\"//g'`
fi

value=`echo $cotent | sed 's/.*"result":\([^,}]*\).*/\1/'`
state=`echo $value | sed 's/\"//g'`

value=`echo $cotent | sed 's/.*"timestamp":\([^,}]*\).*/\1/'`
timestamp=`echo $value | sed 's/\"//g'`
passTime=$(($timestamp / 1000))
buildTime=`date -d @$passTime +"%Y-%m-%d %H:%M:%S"`

value=`echo $cotent | sed 's/.*"duration":\([^,}]*\).*/\1/'`
spend=`echo $value | sed 's/\"//g'`
spends=$(($spend / 1000))
spendTime=`date -d @$spends +"%M分%S秒"`

if [[ "x${state}" == "xSUCCESS" ]] ; then
   curl -X POST -H "Content-Type: application/json" \
        -d '{
    "msg_type":"interactive",
    "card":{
        "config":{
            "wide_screen_mode":true,
            "enable_forward":true
        },
        "elements":[
            {
                "tag":"div",
                "text":{
                    "content":"'"项目名称：$JOB_NAME \n构建编号：第 $BUILD_NUMBER 次构建\n运行时间：$buildTime \n工程分支：$GIT_BRANCH \n构建用户：$userName \n持续时间：$spendTime"'",
                    "tag":"lark_md"
                }
            },
            {
                "actions":[
                    {
                        "tag":"button",
                        "text":{
                            "content":"查看Jenkins报告",
                            "tag":"lark_md"
                        },
                        "url":"'"$BUILD_URL"'",
                        "type":"primary",
                        "value":{

                        }
                    },
                    {
                        "tag": "button",
                        "text": {
                            "content": "查看SonarQube报告",
                            "tag": "lark_md"
                        },
                        "url": "'"$sonarqubeDashboardUrl"'",
                        "type": "default",
                        "value": {}
                    }
                ],
                "tag":"action"
            }
        ],
        "header":{
            "title":{
                "content": "'"$JOB_NAME  build success 😊😊😊!!! "'",
                "tag":"plain_text"
            },
            "template":"green"
        }
    }
}' \
$1
else
   curl -X POST -H "Content-Type: application/json" \
        -d '{
    "msg_type":"interactive",
    "card":{
        "config":{
            "wide_screen_mode":true,
            "enable_forward":true
        },
        "elements":[
            {
                "tag":"div",
                "text":{
                    "content":"'"项目名称：$JOB_NAME \n构建编号：第 $BUILD_NUMBER 次构建\n运行时间：$buildTime \n工程分支：$GIT_BRANCH \n构建用户：$userName \n持续时间：$spendTime"'",
                    "tag":"lark_md"
                }
            },
            {
                "actions":[
                    {
                        "tag":"button",
                        "text":{
                            "content":"查看Jenkins报告",
                            "tag":"lark_md"
                        },
                        "url":"'" $JOB_URL"'",
                        "type":"primary",
                        "value":{

                        }
                    },
                    {
                        "tag": "button",
                        "text": {
                            "content": "查看SonarQube报告",
                            "tag": "lark_md"
                        },
                        "url": "'"$sonarqubeDashboardUrl"'",
                        "type": "default",
                        "value": {}
                    }
                ],
                "tag":"action"
            }
        ],
        "header":{
            "title":{
                "content": "'"$JOB_NAME  build failure 😱😱😱 !!! "'",
                "tag":"plain_text"
            },
            "template":"red"
        }
    }
}' \
$1
fi