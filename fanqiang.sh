#!/bin/bash

if [[ "$(ls /Applications/ | grep 'Google Chrome.app')" = "" ]]; then
    echo '没有安装 Chrome'
    exit 1
fi

function open_chrome {
    open -a "Google Chrome" --args --proxy-server=socks5://127.0.0.1:8000
}

key='-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAwzAkHaAtwkTVa6Q+4M79qL00upPRbZN5PFu1zOLKH9GvpH6A
3CYX0X+VaJsiDo46AUj1sHkbVx0yw7DI9/Ob3Pk7VKfbdnKQn1Eahetvs6rROTju
X1tmj1pzYZpZ0+d94rEcpkAgQskdLenmma7I/SIKT+9KaIMA0QI+5xrfwX9dIskW
f/CzpRba1wmgF39/ZvfyaxPISx5rC1cNXTP0txNIQ8ExORk8MnVrd13IhEdsEGdw
NxEBdR36MteGbQn/B73nMhtVcXDi/JxHa1BatLcDamlwN2DDHGhYAPpgBWQaoEB4
ptJnQkZossQ1ZpRJmiutq1qFqOmda4kFLKOKiwIDAQABAoIBABEVXZPaOScPrz5E
mdxDQaBLLxpFZccZaTsHK9pK3zX5vE3BZLXf/6WubP1C1rA/coQ6RoazktkFDTRj
fLN29uVYSwEVz/eF/3JyPsgJ2zT2dmlzuilObqONXxvjzojlcfctWTyT0D8IKy2h
kzVQPvcoy45De1e6X4/rimXfzEW7INPXyIysofISYBBKNOS/eYK/7fXJ7rhNkLNm
xMiMkiMqyawNJo7cbuQgK/G64rVD2mCPEAaBTn1qxrfMiMN1p1DCNdKi5JO8IoVv
78+Ru8+D+aag8MAaTOefeQ7kr8k2kh36lW9syZN7fGqIjgMkNaXwUjv3vC8ZtYBr
zO8vwIECgYEA6/bUi/jNua+22YgObbXJdmmgGe5fCquhj21z+gIM0s9kUIp+wh76
se5xlzLSz2h5berIfaXqeW+ExoaNE0VM9h2s+4HKr+LqCsV4H4ckhYKso4kot7cy
M0y8p956+f5Qo06oUWTkS0EaXefN6Fs08aNHQ2jwtVBhhpqmJBJfqlMCgYEA08L1
DyYliYw2IsBrbyAtXYJ0vAaHjVKIPQvhSDqZ+v++GsQF+it7HVextMNYbpGxcf01
82O/H3cU6UsHqFrdwkpmUTrQ3D7f04DwgeNjYXUsmT9lhhxuP79oiJNsiMErPUZQ
8woh1gMWn8Srp5GFgxIeP5RyBOIWWA9PidnJx+kCgYEA0JCIh/vvowv8G8RVtIU0
wDRWbfUzDpRrpgHBvB5pxT/I1CPGLMEDJ5ix0En86ZTXl98pPV4UpSd7/ZnaQklD
4FqUlm2/gL2ZztGB/qQOFPBOtfG7Cr+jYJKYQey1WBiAoAgbYG5EF3xA2PXWG2Xa
oyaGC8BK2ohk23wAE+wloL8CgYALvs1+2JvOZEOAa/HJiRxbCmhVIXuVQBWkZStK
qU1vGY4+x86ZEJ5Ug0+s+gTGpTgVXXkHlem84gr74Zh8IwYXx66jJML+5FHf1lAA
tE8H0cr2eQi1hpAq4v/2S08CyswOKv9Ea7RyvVsc43it46lnGrMozaABW1Tn73l2
6OiDOQKBgBAlZ+w5HV22OPfjAB5aWJhyGwIgz+zexhK1t7D9Qi/5DuMVv5zZNSg4
1bCZv/RmfhX0Rj8fypAxmdkw3OvB8/HMJ6a94KCo/UdgXeMUGpeJ48eltk1wNIwT
O0BgQM5+sxL9+kVOBUg9hvi0rRL2moabPS7tz7HDjY+6os4SAn3P
-----END RSA PRIVATE KEY-----'

echo '正在生成密钥文件...'
echo "$key" > private.key && chmod 600 private.key

echo '正在检测环境...'
old_pid=$(ps ax | grep 'ssh -p 705' | grep -v 'grep' | awk '{print $1}')
[[ "$old_pid" = "" ]] || kill $old_pid

echo '正在连接服务器...'
ssh -p 705 -i ./private.key -D 8000 -NCf fmy@54.213.235.110 > /dev/null 2>&1
echo '已经连接到服务器'

old_chrome=$(ps ax | grep 'Google Chrome.app/Contents/MacOS/Google Chrome' | grep -v 'grep' | awk '{print $1}')
if [[ "$old_chrome" != "" ]]; then
    COUNTER=0
    while [  $COUNTER -lt 3 ]; do
        let COUNTER+=1
        if read -t 900 -p '已有 Chrome 在运行，确定退出当前的 Chrome ？[Y/N]  '; then 
            case "$REPLY" in 
                y|Y )
                    kill $old_chrome
                    echo '正在关闭当前的 Chrome...'
                    sleep 2
                    break
                    ;;
                n|N )
                    echo '已经退出翻墙环境'
                    exit 0
                    break
                    ;;
                * )
                    echo '输入有误，请重新输入'
                    ;;
            esac
        else 
            echo '（输入超时）'
            exit
        fi 
    done
fi

echo '正在启动Chrome...'
open_chrome

