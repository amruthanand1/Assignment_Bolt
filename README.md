
# DBT Project Documentation Setup

## Prerequisites
1. **Python**: Version 3.8 or above is recommended.
2. **pip**: Ensure you have Python's package manager installed.
3. **DBT**: Installed as part of the virtual environment setup.

---

## Instructions

### 1. Create a Virtual Environment
Run the following commands to set up and activate a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
```

### 2. Install Dependencies
Install the required Python packages from `requirements.txt`:
```bash
pip install -r requirements.txt
```

### 3. Install DBT Dependencies
Run the following command to download the DBT project dependencies:
```bash
export DBT_ENV=staging
dbt deps
```

### 4. Compile the Project
Compile your DBT project by running:
```bash
dbt compile
```

### 5. Generate Documentation
Generate documentation for your DBT project:
```bash
dbt docs generate
```

### 6. Serve Documentation
Serve the generated documentation on a local web server:
```bash
dbt docs serve
```

### 7. Access the Documentation
Follow the logs, usuallt we can navigate to http://localhost:8080 to find documentation

---

## Additional Notes
- Make sure to activate the virtual environment every time before running DBT commands.
- If you encounter any issues, ensure that all dependencies are correctly installed and DBT is configured properly.

