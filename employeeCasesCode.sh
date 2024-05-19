#!/bin/bash

# Declare:
# store the medicines in a variable called: MedecinFile:
MedicineFile="medicines.txt"
# store the scedual in a variable called: WorkScedual
WorkScedual="workingtime.txt"

# two menu for the employee
# first menu is the main menu:
main_menuForemployee() {
    while true; do
    
    
        echo "
        -----------------------------------
        Employee List tasks:
        1) medicine storage
        2) View week work schedule
        3) Exit
        -----------------------------------"
        
        read -p "Choose an option by adding its number please: "  main_choice 
        case $main_choice in
            1)
                medicine_menu
                ;;
            2)
                view_WeekWschedule
                ;;
            3)
                echo "
--------------------------------
Exiting the program. Good work!
--------------------------------
                "
                break
                ;;
            *) # anything else must be an invalid option
                echo "
--------------------------------Invalid option.
                                Please try again, and choose from the options"
                ;;
        esac
    done
}









# this function to view the week work schedule:
view_WeekWschedule() {
    echo "this work schedule for this week:"
    cat $WorkScedual
}










# second menu is for storage of pharmacy:
medicine_menu() {
    while true; do
        echo "the medicine Storage tasks:"
        
        echo "1) View all medicines in the pharmacy"
        echo "2) Add a new medicine to the storage"
        echo "3) Return to Main Menu"
        
        read -p "Choose an option: " medicine_choice
        case $medicine_choice in
            1)
                view_medicines
                ;;
            2)
                add_medicine
                ;;
            3)
                break
                ;;
            *)
                echo "
--------------------------------Invalid option.
                                Please try again, and choose from the options"
                ;;
        esac
    done
}











view_medicines() {
    echo "                                              
----------------------------------------    
    "
    echo "This is all medicines in the pharmacy storage:"
    cat $MedicineFile
echo "                                                        

"
}











# Function to add a new medicine
add_medicine() {

    # find the next number.. by counting the lines in the file
  
    next_Num=$(($(wc -l < $MedicineFile) + 1))
echo "       
    
    "
    read -p "Enter the medicine name that you want to add: " medicine_name
    read -p "Enter the price of the medicine: " medicine_price
    echo "$next_Num $medicine_name ${medicine_price}RS" >> $MedicineFile
    echo "       
    
    "
    echo "Medicine name and its price added successfully."
    echo "       
    
    "
}




# this line is important to Run the main menu
main_menuForemployee

