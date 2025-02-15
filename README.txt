1.Thông tin các thành viên trong nhóm
- Trần Quang Đãng       52100174
- Trương Đình Văn       52100369
- Nguyễn Thị Hồng Hạnh  52100791



2.Hướng dẫn chạy chương trình step-by-step
Chạy Chương Trình Kiểm Thử với Robot Framework

Hướng dẫn này sẽ giúp cài đặt và chạy các chương trình kiểm thử sử dụng Robot Framework. Nó bao gồm các hướng dẫn về cài đặt các thư viện cần thiết và chạy các test case nằm trong các thư mục riêng biệt.

Yêu Cầu

Đảm bảo rằng bạn đã cài đặt các phần mềm sau trên hệ thống của mình:
- Python
- pip

Cài Đặt

1. Cài đặt Robot Framework:
   `pip install robotframework`

2. Cài đặt SeleniumLibrary:
   `pip install robotframework-seleniumlibrary`

Cấu Trúc Thư Mục

Cấu trúc dự án của  như sau:

source/
├── Buy Items test
├── Checkout test
│   ├── error user
│   ├── performance glitch user
│   ├── problem user
│   ├── visual user
│   └── standard user
├── Login test
├── Logout test
├── Reset App state test
├── Sort items test
├── View All item test
├── View Detail Item test
└── resources.robot

Chạy Các Kiểm Thử

Lưu Ý Quan Trọng
Sẽ có một số test case bị chính nhóm chủ đích đánh FAIL và đưa ra thông báo. Nếu test case FAIL vì lỗi, hãy thử chạy từng test case và đảm bảo rằng đường truyền mạng ổn định.

1.1 Điều hướng đến thư mục chứa test case:
   Vào thư mục chứa test case  muốn chạy. Ví dụ, để chạy test trong thư mục test_case_folder_1:
   `cd my_test_project/test_case_folder_1`
1.2 Chạy test case:
   Sử dụng lệnh robot kèm theo tên tệp test case. Ví dụ:
   `robot test_case_1.robot`

2.1 Đặc biệt với thư mục `Checkout test`:
   Vào thư mục `Checkout test`:
   `cd my_test_project/Checkout test/test_case_folder_1`
2.2 Chạy test case:
   Sử dụng lệnh robot kèm theo tên tệp test case. Ví dụ:
   `robot test_case_1.robot`

Chạy Tất Cả Các Kiểm Thử

Để chạy tất cả các test case trong các thư mục khác nhau, bạn có thể thực hiện lệnh sau từ thư mục tests:
    `cd my_test_project`
    `robot .`

Lệnh này sẽ tìm và chạy tất cả các tệp .robot trong thư mục và các thư mục con của nó.

Ví Dụ Test Case
Dưới đây là ví dụ về một test case đơn giản (buy_items_test.robot):
*** Settings ***
Resource    ../resources.robot
*** Test Cases ***
Verify Buy Items with standard user
    Open Browser to Login
    Maximize Browser Window
    Login with standard user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Buy Sauce Labs Backpack
    . . . . . . . . . . . .


Tài Nguyên Bổ Sung

- Robot Framework User Guide: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
- SeleniumLibrary Documentation: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

Khắc Phục Sự Cố

- Đảm bảo rằng tất cả các đường dẫn đều đúng và các thư viện đã được cài đặt.
Nếu bạn gặp bất kỳ vấn đề nào, tham khảo Hướng Dẫn Khắc Phục Sự Cố của Robot Framework: https://www.nrtcautomation.com/blog/how-to-troubleshoot-a-robot
