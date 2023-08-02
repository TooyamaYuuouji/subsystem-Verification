#!/bin/bash

<<EOF
利用 ralgen 批量生成寄存器模型
EOF

echo "Notice: please make sure there's a folder named "ralf" and all .ralf files in it!"
ralfDir=ralf
suffix=ralf
if [ -d $ralfDir ]
then
    cd $ralfDir
    ralfArray=(*)
    for file in ${ralfArray[@]}
    do
        if [ ${file##*.} = $suffix ]
        then
            name=${file%.*}
            line=$(tac $file | grep "block")  # 反向查找含有 block 关键字的一行
            topName=$(echo $line | cut -d " " -f 2)  # 以空格为分隔符，取得第二个字符串
            ralgen $file -full64 -uvm -t $topName -o ../$name
            echo "ralf file ${file} has been successfully processed! new file name: ${name}.sv"
        else
            continue
        fi
    done
else
    echo "--- Exit! Check folder! ---"
    exit 1
fi