##不适用与JIT编译器
export JAVA_COMPILER=""

#!/bin/sh

ENGINE_HOME=/home/crmsput/IFRS9/Engine
export ENGINE_HOME

cd $ENGINE_HOME/bin

export LANG=zh_CN
JAVA_HOME=/usr/java6_64
export JAVA_HOME
  
if [ -z "$JAVA_HOME" ]; then
echo "Please configure the JAVA_HOME!"
exit
fi

if [ -z "$ENGINE_HOME" ]; then
echo "Please configure the ENGINE_HOME!"
exit
fi

CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:../classes
export CLASSPATH

JLIBDIR=../lib
export JLIBDIR

for LL in `ls $JLIBDIR/*.jar`
do
CLASSPATH=$CLASSPATH:$LL
export CLASSPATH

done

JAVA_OPTION="-Dfile.encoding=GBK -Xmx1024M -Xms512M"
RUN_CLASS=com.amarsoft.ifrs9.engine.run.ImmediateEngineRunner

export JAVA_OPTION
export RUN_CLASS

########清理物理文件#########

rm -f /home/CRMS_FILE/IFRS9/flag/breakEngine.flg

${JAVA_HOME}/bin/java ${JAVA_OPTION} -classpath ${CLASSPATH}  ${RUN_CLASS} 
