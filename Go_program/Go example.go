// Go program
//Jason Bengtson

package main

import (
	"fmt"	
	"os"
	"log"
	"bufio"
	"strings"
	"strconv"
)

func main(){
	fmt.Println("Enter what file with .txt at end ex: input.txt")
	var input string //instantiationg input string
	fmt.Scanln(&input) // taking input for text file
	open (input)

}

func open (input string) {
	var myfile string

	file, err := os.Open(input) //opeing specified file
	if err != nil { // error checking file
		log.Fatal(err)
	}
	//opening and closing the file as we call for it
	defer file.Close()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		//printing text file to characters
		myfile += " " + scanner.Text()

	}

	// calling the function for removing numbers
	remNum (myfile)
}
func remNum(myfile string) {

        var noNum string = myfile
// This for loop iterates up to 9, then converts the int i into a string
// so it can replace all instances of that number with Replace
	for i := 0; i >= 0 && i < 10; i++ { 
		noNum = strings.Replace(noNum, strconv.Itoa(i), "", -1)

	}
// This calls the function to write the data to a new output file named
// by the user
	 output(noNum)
}

func output (noNum string) {
	fmt.Println("Please enter name of output file, ex: 'output.txt'")

	var input2 string
	fmt.Scanln(&input2)
// creating the file with users desired name
	w, err := os.Create(input2)
	if err != nil {
// panic function making sure no errors
		panic(err)
	}
	defer w.Close()
// calls the creation of the file and writing of the string to it
	w.WriteString(noNum)
	


}





