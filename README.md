# Blockchain-Based Healthcare Remote Monitoring System

This project implements a blockchain-based system for remote healthcare monitoring using Clarity smart contracts. The system enables secure, transparent, and privacy-preserving health data collection and monitoring.

## Overview

The system consists of five main smart contracts that work together to create a comprehensive healthcare monitoring solution:

1. **Provider Verification Contract**: Validates and manages healthcare entities
2. **Patient Verification Contract**: Manages participant identities and consent
3. **Device Registration Contract**: Records and manages monitoring equipment
4. **Data Collection Contract**: Securely tracks health metrics
5. **Alert Management Contract**: Handles notification of concerning readings

## Smart Contracts

### Provider Verification Contract

This contract manages the verification of healthcare providers on the blockchain.

Key features:
- Register new healthcare providers
- Verify provider credentials
- Check provider verification status
- Retrieve provider details

### Patient Verification Contract

This contract manages patient identities and consent for data collection.

Key features:
- Register new patients (by verified providers)
- Manage patient consent for data collection
- Check patient consent status
- Retrieve patient details (restricted access)

### Device Registration Contract

This contract manages medical devices used for remote monitoring.

Key features:
- Register new monitoring devices
- Assign devices to patients
- Unassign devices from patients
- Retrieve device details
- Deactivate devices

### Data Collection Contract

This contract securely records health metrics from monitoring devices.

Key features:
- Record health data from verified devices
- Ensure patient consent before data collection
- Restrict data access to authorized parties
- Retrieve health data (restricted access)

### Alert Management Contract

This contract manages alerts for concerning health readings.

Key features:
- Set thresholds for different health metrics
- Calculate severity based on readings
- Create alerts for concerning readings
- Acknowledge alerts
- Retrieve alert details

## Security Features

- **Role-based access control**: Different functions are restricted to appropriate roles (admin, provider, patient)
- **Consent management**: Patient data can only be collected with explicit consent
- **Device verification**: Health data can only be recorded from properly registered and assigned devices
- **Data privacy**: Health data access is restricted to the patient, their provider, and system administrators

## Error Codes

- `u100`: Resource already exists
- `u401`: Not authorized (provider not verified)
- `u402`: Patient consent not given
- `u403`: Permission denied
- `u404`: Resource not found
- `u405`: Device not assigned to patient

## Testing

The project includes comprehensive tests for all smart contracts using Vitest. The tests cover:

- Provider registration and verification
- Patient registration and consent management
- Device registration and assignment
- Health data collection
- Alert creation and management

## Getting Started

1. Clone the repository
2. Run the tests: `npm test`
3. Deploy the contracts to a Stacks blockchain

## License

This project is licensed under the MIT License.
\`\`\`

```md project="Healthcare Blockchain" file="PR-DETAILS.md" type="markdown"
# Pull Request: Blockchain-Based Healthcare Remote Monitoring System

## Overview

This PR implements a comprehensive blockchain-based healthcare remote monitoring system using Clarity smart contracts. The system enables secure, transparent, and privacy-preserving health data collection and monitoring.

## Key Components

1. **Provider Verification Contract**: Validates healthcare entities
   - Registers and verifies healthcare providers
   - Maintains provider credentials and verification status

2. **Patient Verification Contract**: Manages participant identities
   - Registers patients under verified providers
   - Manages patient consent for data collection
   - Controls access to patient information

3. **Device Registration Contract**: Records monitoring equipment
   - Registers medical devices with their specifications
   - Manages device assignment to patients
   - Ensures devices are properly registered before data collection

4. **Data Collection Contract**: Tracks health metrics
   - Records health data from verified devices
   - Ensures patient consent before data collection
   - Restricts data access to authorized parties

5. **Alert Management Contract**: Handles notification of concerning readings
   - Sets thresholds for different health metrics
   - Calculates severity based on readings
   - Creates and manages alerts for concerning health data

## Implementation Details

- All contracts implement role-based access control
- Contracts interact with each other to verify permissions and relationships
- Data privacy is maintained through strict access controls
- Comprehensive test suite using Vitest

## Security Considerations

- Patient data is only collected with explicit consent
- Health data access is restricted to the patient, their provider, and system administrators
- Device verification ensures data comes from legitimate sources
- Admin functions are protected with proper authorization checks

## Testing

The PR includes comprehensive tests for all smart contracts:
- Unit tests for each contract function
- Integration tests for contract interactions
- Edge case handling and error testing

## Future Enhancements

- Add data encryption for additional privacy
- Implement time-based access controls
- Add support for multi-signature approvals for critical operations
- Enhance alert notification system with external integrations
