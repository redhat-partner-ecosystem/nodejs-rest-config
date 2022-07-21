PROD_NAMESPACE = nodejs-gitops-main
DEV_NAMESPACE = nodejs-gitops-develop
QA_NAMESPACE = nodejs-gitops-release
BUILD_NAMESPACE = nodejs-gitops-pipeline

.PHONY: cleanup
cleanup:
	oc delete build --all -n ${BUILD_NAMESPACE}
	oc delete pipelineruns,taskruns --all -n ${BUILD_NAMESPACE}
	oc delete pod --field-selector=status.phase==Succeeded -n ${BUILD_NAMESPACE}
	oc delete pod --field-selector=status.phase==Succeeded -n ${DEV_NAMESPACE}
	oc delete pod --field-selector=status.phase==Succeeded -n ${QA_NAMESPACE}
	oc delete pod --field-selector=status.phase==Succeeded -n ${PROD_NAMESPACE}
