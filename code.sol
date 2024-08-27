// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Define a structure to hold student data
    struct Student {
        string name;
        uint256 age;
        string email;
    }

    // Mapping from student ID to Student structure
    mapping(address => Student) private students;

    // Event to be emitted when a student's data is updated
    event StudentUpdated(address indexed studentAddress, string name, uint256 age, string email);

    // Function to add or update student data
    function setStudent(string memory name, uint256 age, string memory email) public {
        students[msg.sender] = Student(name, age, email);
        emit StudentUpdated(msg.sender, name, age, email);
    }

    // Function to retrieve student data by student address
    function getStudent(address studentAddress) public view returns (string memory, uint256, string memory) {
        Student memory student = students[studentAddress];
        return (student.name, student.age, student.email);
    }

    // Function to check if a student has data stored
    function hasStudentData(address studentAddress) public view returns (bool) {
        return bytes(students[studentAddress].name).length > 0;
    }
}
