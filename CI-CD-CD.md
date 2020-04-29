# DevOps practices

## Continuous Integration [CI]

> Automate testing to ensure code quality and validate project requirements

## Continuous Delivery [CD]

> Automate building of artifacts (docker containers) that are packing the successfully tested code

## Continuous Deployment [CD]

> Automate deployment of the built artifacts (docker containers) on production environment


### Stages of polishing those processes
1. Research for proper tools and practices
2. Analysis of the latter how adequate are for the needs of current and future projects
3. Compile infrastructure requirements
4. Manual reproduction of the steps and compiling software structural requirements, needed to achieve automation
5. Developer acceptance of those structural requirements
6. Compiling specification for all the needed containers
7. Implementation in the Automation server (Jenkins)
8. Clearing bugs and problems - repetition of steps 4. 5. 6. (7. in very rare cases) and back to 8.
9. Automation will be considered stable, when used for more than 1 (preferably 2) release cycles, without major problems
10. Reuse in future projects and improve

### Where are we:

#### CI
 - 1 full project cycle for QRScale, but most of the complicated test automation had only 1 release cycle
 - 1 release cycle for QRManual - all test automation was available
 - stage 10
 
### CDelivery
 - 1 release cycle for QRManual
 - test environment setup automation - foundation was made, testing environment was set and working
 - still need to improve separation of core code and testing components
 - delivery of production ready containers is in early stage - 0 cycles
 - stage 8.
 
### CDeployment
 - clone of production environment is setup
 - deployment is manual
 - stage 3. 4.