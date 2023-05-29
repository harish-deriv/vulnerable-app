#!/bin/bash

# Create directories
mkdir -p db app/lib/MyApp/Controller app/lib/MyApp/Model app/script

# Create files
touch db/Dockerfile db/init.sql app/Dockerfile app/script/myapp docker-compose.yml
touch app/lib/MyApp/Controller/SQLInjection.pm app/lib/MyApp/Controller/BrokenAuth.pm 
app/lib/MyApp/Controller/SensitiveDataExposure.pm
touch app/lib/MyApp/Controller/XMLExternalEntities.pm app/lib/MyApp/Controller/BrokenAccessControl.pm
touch app/lib/MyApp/Controller/SecurityMisconfiguration.pm app/lib/MyApp/Controller/XSS.pm
touch app/lib/MyApp/Controller/InsecureDeserialization.pm app/lib/MyApp/Controller/ComponentsWithKnownVulnerabilities.pm
touch app/lib/MyApp/Controller/InsufficientLoggingMonitoring.pm app/lib/MyApp/Model/Example.pm

