#!/bin/sh

#  test.sh
#  
#
#  Created by li on 14-2-25.
#
echo "---------------------------------------------start"

# 1. Change the output file path by yourself
echo "pwd = $PWD"
outputfile="$PWD/../Classes/ResourcesPath.h"

# 2. Specify your resources directory name

path=$PWD

echo  "OUTPUTFILE = $outputfile"

rm $outputfile

#define array
imageArray=()

plistArray=()

audioArray=()

fontArray=()

tmxArray=()

xmlArray=()

jsonArray=()

spineArray=()

txtArray=()

shaderArray=()

ccbArray=()

loopDir(){
for file in find *
do

if [ -d $file ]
then

echo "directory  [ $file ] "
#echo "//\t directory $file"  >>  $outputfile

cd ./$file

loopDir

cd ..


elif [ -f $file ]
then

#echo "[ $file ]  \t \t is file"

if [ ${file##*.} = "png" ]
then

length=${#imageArray[*]}
rPath=${PWD##*$path}/$file
imageArray[$length]=${rPath#*/}
echo "${imageArray[length]} >> Image Array"

elif [ ${file#*.} = "jpg" -o ${file##*.} = "jpeg" ]
then

length=${#imageArray[*]}
rPath=${PWD##*$path}/$file
imageArray[$length]=${rPath#*/}
echo "${imageArray[length]} >> Image Array"

elif [ ${file#*.} = "pvr.ccz" -o ${file##*.} = "pvr.gz" ]
then

length=${#imageArray[*]}
rPath=${PWD##*$path}/$file
imageArray[$length]=${rPath#*/}
echo "${imageArray[length]} >> Image Array"

elif [ ${file#*.} = "pvr" ]
then

length=${#imageArray[*]}
rPath=${PWD##*$path}/$file
imageArray[$length]=${rPath#*/}
echo "${imageArray[length]} >> Image Array"

elif [ ${file##*.} = "plist" ]
then

length=${#plistArray[*]}
rPath=${PWD##*$path}/$file
plistArray[$length]=${rPath#*/}
echo "${plistArray[length]} >> Plist Array"

elif [ ${file##*.} = "fnt" -o ${file##*.} = "ttf" ]
then

length=${#fontArray[*]}
rPath=${PWD##*$path}/$file
fontArray[$length]=${rPath#*/}
echo "${fontArray[length]} >> Font Array"

elif [ ${file##*.} = "tga" ]
then

length=${#imageArray[*]}
rPath=${PWD##*$path}/$file
imageArray[$length]=${rPath#*/}
echo "${imageArray[length]} >> Image Array"

elif [ ${file##*.} = "tmx" ]
then

length=${#tmxArray[*]}
rPath=${PWD##*$path}/$file
tmxArray[$length]=${rPath#*/}
echo "${tmxArray[length]} >> Tmx Array"

elif [ ${file##*.} = "ogg" ]
then

length=${#audioArray[*]}
rPath=${PWD##*$path}/$file
audioArray[$length]=${rPath#*/}
echo "${audioArray[length]} >> Audio Array"

elif [ ${file##*.} = "wav" -o ${file##*.} = "WAV" ]
then

length=${#audioArray[*]}
rPath=${PWD##*$path}/$file
audioArray[$length]=${rPath#*/}
echo "${audioArray[length]} >> Audio Array"

elif [ ${file##*.} = "mp3" -o ${file##*.} = "MP3" ]
then

length=${#audioArray[*]}
rPath=${PWD##*$path}/$file
audioArray[$length]=${rPath#*/}
echo "${audioArray[length]} >> Audio Array"

elif [ ${file##*.} = "xml" ]
then

length=${#xmlArray[*]}
rPath=${PWD##*$path}/$file
xmlArray[$length]=${rPath#*/}
echo "${xmlArray[length]} >> XML Array"

elif [ ${file##*.} = "json" ]
then

length=${#jsonArray[*]}
rPath=${PWD##*$path}/$file
jsonArray[$length]=${rPath#*/}
echo "${jsonArray[length]} >> Json Array"

elif [ ${file##*.} = "atlas" ]
then

length=${#spineArray[*]}
rPath=${PWD##*$path}/$file
spineArray[$length]=${rPath#*/}
echo "${spineArray[length]} >> Spine Array"

elif [ ${file##*.} = "txt" ]
then

length=${#txtArray[*]}
rPath=${PWD##*$path}/$file
txtArray[$length]=${rPath#*/}
echo "${txtArray[length]} >> TXT Array"

elif [ ${file##*.} = "fsh" -o ${file##*.} = "vsh" ]
then

length=${#shaderArray[*]}
rPath=${PWD##*$path}/$file
shaderArray[$length]=${rPath#*/}
echo "${shaderArray[length]} >> Shader Array"

elif [ ${file##*.} = "ccbi" ]
then

length=${#ccbArray[*]}
rPath=${PWD##*$path}/$file
ccbArray[$length]=${rPath#*/}
echo "${ccbArray[length]} >> ccb Array"

fi

fi

done

}

makeStruct()
{
length=${#array[*]}
for ((i=0; i<$length; i++))
do
filename=${array[$i]}
filepath=${filename}
filename=${filename##*/}
filename=${filename%%.*}
filename=${filename//-/_}
printf "\t\t std::string %-30s=%50s;\n" "${filename}" "\"${filepath}\"" >>  $outputfile
#echo ${filename} + ${filepath}
done
}

makeResList()
{

# ----------------------------------------image------------------------------------------
array=(${imageArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Image{" >> $outputfile
makeStruct
echo "\t } image;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------image------------------------------------------
# ----------------------------------------plist------------------------------------------
array=(${plistArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Plist{" >> $outputfile
makeStruct
echo "\t } plist;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------plist------------------------------------------
# ----------------------------------------audio------------------------------------------
array=(${audioArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Audio{" >> $outputfile
makeStruct
echo "\t } audio;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------audio------------------------------------------
# ----------------------------------------font------------------------------------------
array=(${fontArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Font{" >> $outputfile
makeStruct
echo "\t } font;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------font------------------------------------------
# ----------------------------------------tmx------------------------------------------
array=(${tmxArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Tmx{" >> $outputfile
makeStruct
echo "\t } tmx;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------tmx------------------------------------------
# ----------------------------------------xml------------------------------------------
array=(${xmlArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Xml{" >> $outputfile
makeStruct
echo "\t } xml;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------xml------------------------------------------
# ----------------------------------------json------------------------------------------
array=(${jsonArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Json{" >> $outputfile
makeStruct
echo "\t } json;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------json------------------------------------------
# ----------------------------------------spine------------------------------------------
array=(${spineArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Spine{" >> $outputfile
makeStruct
echo "\t } spine;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------spine------------------------------------------
# ----------------------------------------txt------------------------------------------
array=(${txtArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Txt{" >> $outputfile
makeStruct
echo "\t } txt;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------txt------------------------------------------
# ----------------------------------------shader------------------------------------------
array=(${shaderArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Shader{" >> $outputfile
makeStruct
echo "\t } shader;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------shader------------------------------------------
# ----------------------------------------ccb------------------------------------------
array=(${ccbArray[*]})
length=${#array[*]}
if [ $length -gt 0 ]
then
echo "\t struct Ccb{" >> $outputfile
makeStruct
echo "\t } ccb;" >> $outputfile
echo "" >> $outputfile
fi
# ----------------------------------------ccb------------------------------------------


}


echo "//" >> $outputfile
echo "//" >> $outputfile
echo "//\tResourcesPath.h" >> $outputfile
echo "//\t " >> $outputfile
echo "//\tCreated by ${HOME##*/} on `date +%F`" >> $outputfile
echo "//" >> $outputfile
echo "//" >> $outputfile
echo "" >> $outputfile
echo "#ifndef ResourcesPath_h" >> $outputfile
echo "#define ResourcesPath_h" >> $outputfile
echo "" >> $outputfile
echo "" >> $outputfile

echo "static struct Resourses{" >> $outputfile
echo "" >> $outputfile

loopDir

makeResList

echo "" >> $outputfile
echo "} R;" >> $outputfile

echo "" >> $outputfile
echo "#endif" >> $outputfile
echo

echo "${outputfile##*/}  >> ${outputfile}"

echo "---------------------------------------------Finish"
