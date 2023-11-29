CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f 'student-submission/ListExamples.java' ]]
then 
    echo "it works"
else
    echo "This is the incorrect file"
fi

cp -r lib grading-area
cp TestListExamples.java grading-area
cp student-submission/ListExamples.java grading-area


cd grading-area
# javac ListExamples.java
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
if [[ $? -eq 0 ]]
then
    echo "complied successfully"
    pwd
    java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt
    cat output.txt

else
    echo "compile failed"
fi 

cd ..









# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
