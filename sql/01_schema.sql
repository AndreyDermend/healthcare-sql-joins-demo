  CREATE TABLE Patients (
    patient_ID INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    address TEXT
  );
  CREATE TABLE Insurance (
    insurance_ID INT PRIMARY KEY,
    insurance_name TEXT,
    insurance_num INT,
    deductable INT,
    co_pay INT
  );
  CREATE TABLE Billing (
    billing_ID INT PRIMARY KEY,
    date_paid DATE,
    amount_paid INT,
    card_num TEXT,
    CVV INT,
    insurance_ID INT,
    FOREIGN KEY (insurance_ID) REFERENCES Insurance(insurance_ID)
  );
  CREATE TABLE Suppliers (
    suppliers_ID INT PRIMARY KEY,
    country TEXT,
    suppliers_name TEXT
  );
  CREATE TABLE Supplies (
    supply_ID INT PRIMARY KEY,
    stock INT,
    category TEXT,
    supplier_ID INT,
    FOREIGN KEY (supplier_ID) REFERENCES Suppliers(supplier_ID)
  );
  CREATE TABLE Facilities (
    facility_ID INT PRIMARY KEY,
    floor INT,
    room_num INT,
    supply_ID INT,
    FOREIGN KEY (supply_ID) REFERENCES Supplies(supply_ID)
  );
  CREATE TABLE Staff (
    staff_ID INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    facility_ID INT,
    FOREIGN KEY (facility_ID) REFERENCES Facilities(facility_ID)
  );
  CREATE TABLE Nurses (
    nurse_ID INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    shift_day TEXT,
    shift_hours TEXT
  );
  CREATE TABLE Treatment (
    treatment_ID INT PRIMARY KEY,
    medication_code INT
  );
  CREATE TABLE Providers (
    provider_ID INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    NPI INT,
    license_num INT,
    license_state TEXT
  );
CREATE TABLE Pharmacy (
  pharmacy_ID INT PRIMARY KEY,
  US_state TEXT,
  county TEXT,
  city TEXT,
  provider_ID INT,
  FOREIGN KEY (provider_ID) REFERENCES Providers(provider_ID)
);
  CREATE TABLE Specialization (
    specialization_ID INT PRIMARY KEY,
    specialty TEXT,
    provider_ID INT,
    FOREIGN KEY (provider_ID) REFERENCES Providers(provider_ID)
  );
  CREATE TABLE Visits (
    visit_ID INT PRIMARY KEY,
    patient_ID INT,
    nurse_ID INT,
    provider_ID INT,
    bill_ID INT,
    facility_ID INT,
    visit_date DATE,
    FOREIGN KEY (provider_ID) REFERENCES Providers(provider_ID),
    FOREIGN KEY (patient_ID) REFERENCES Patients(patient_ID),
    FOREIGN KEY (facility_ID) REFERENCES Facilities(facility_ID),
    FOREIGN KEY (bill_ID) REFERENCES Billing(bill_ID),
    FOREIGN KEY (nurse_ID) REFERENCES Nurses(nurse_ID)
  );
  CREATE TABLE Labs (
    lab_ID INT PRIMARY KEY,
    lab_code INT,
    results TEXT,
    visit_ID INT,
    FOREIGN KEY (visit_ID) REFERENCES Visits(visit_ID)
  );
  CREATE TABLE Differentials (
    differential_ID INT PRIMARY KEY,
    diagnosis TEXT,
    visit_ID INT,
    treatment_ID INT,
    FOREIGN KEY (visit_ID) REFERENCES Visits(visit_ID),
    FOREIGN KEY (treatment_ID) REFERENCES Treatment(treatment_ID)
  );
