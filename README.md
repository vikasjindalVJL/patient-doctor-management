# Patient Doctor Management

This is a management system where patient, doctor and pharmacist can create their profile.
Patients have medical records associated with them. To access those records, doctors and pharmacists can request for records access from the patients and only after patient's approval, they can view the records.

Please visit https://patient-doctor-management.herokuapp.com to see the live working project.

### Demo Credentials - 

**For Patients -**
```
email: sanjay_sharma@gmail.com 
password: sanjay123
email: nikita_nanda@gmail.com 
password: nikita123
email: vikas_jindal@gmail.com 
password: vikas123
email: vivek_kumar@gmail.com 
password: vivek123
email: abhay_mishra@gmail.com 
password: abhay123
email: abhiraj_dev@gmail.com 
password: abhiraj123
email: gaurav_singh@gmail.com 
password: gaurav123
```

**For Doctors -**
```
email: shakuntala_devi@gmail.com 
password: shakuntala123
email: sree_kumar@gmail.com 
password: sree123
email: narayan_swami@gmail.com 
password: narayan123
```

**For Pharmacist -**
```
email: guru_prashad@gmail.com 
password: guru123
```

### Functionalities 
1. Common for all users
   - Sign Up
   - Login
   - Logout
   
2. For Doctors/ Pharmacists
   - Can view the list of all the patients registered in the system.
   - Can create a request to get access of Patient's medical records.
   - Can view the status of existing request.
   
3. For Patients
   - Can view the list of all the requests waiting for approval.
   - Can approve the request for records' access.
   - Can reject the request for records' access.

## Getting Started

### Prerequisites

Configurations
```
Ruby version 2.5.0
Rails version 5.1.6
MongoDB shell version v3.4.10
```

### Steps to install

After cloning the project

Run following commands
```
bundle install
rails s
```
