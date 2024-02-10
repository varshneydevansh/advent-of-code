#include<iostream>
#include<fstream>
#include<string>

int main()
{
    int total_sum = 0;
    
    std::string calibration_value;
    std::ifstream calib_doc("day1_input.txt");

    while(std::getline(calib_doc, calibration_value))
    {
        int first_digit = 0, last_digit = -1;
        int i = 0;

 //       std::cout << "1. calib: " << calibration_value << " first: " << first_digit << "last: " << last_digit << "\n";

        for(; i < calibration_value.length(); i++)
        {
            if(isdigit(calibration_value[i]))
            {
                first_digit = ((int)calibration_value[i] - '0') * 10;
 //               std::cout << "for 1 : :  " << calibration_value << " first: " << first_digit << "last: " << last_digit << "\n";
                break;
            }
        }
                

        for(int j = i; j < calibration_value.length(); j++)
        {
            if(calibration_value[j] >= '0' && calibration_value[j] <= '9')
            {
                last_digit = (int)calibration_value[j] - '0';
 //                               std::cout << "for 2 : :  " << calibration_value << " first: " << first_digit << "last: " << last_digit << "\n";

            }
        }

        if(last_digit == -1)
        {
            last_digit = first_digit /10;
        }

        total_sum += first_digit + last_digit;
 //       std::cout << "total sum at: " << total_sum << " first: " << first_digit << "last: " << last_digit << "\n";
    }

    std::cout << total_sum << "\n";

    return 0;
}