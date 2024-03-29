CONNECTOR_VERS := $(shell yq .version charts/connector/Chart.yaml)

build: packages/connector-$(CONNECTOR_VERS).tgz
	helm repo index .

packages/connector-$(CONNECTOR_VERS).tgz: $(wildcard charts/connector/* charts/connector/*/*)
	cd charts/connector && \
		helm template --set connectorToken=foobar . > /dev/null # verify build
	cd charts && \
		helm package -d ../packages connector
