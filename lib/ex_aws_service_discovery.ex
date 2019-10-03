defmodule ExAws.ServiceDiscovery do
  @moduledoc """
  Documentation for ExAws.ServiceDiscovery.
  """

  
  
  # 
  # CreateService

  # DeleteNamespace
  # DeleteService

  # DiscoverInstances

  # UpdateService

  def create_http_namespace(name, opts \\ []) do
    data = %{
      Name: name,
      Description: opts |> Keyword.get(:description, ""),
      CreatorRequestId: opts |> Keyword.get(:creator_request_id, "")
    }
    request("CreateHttpNamespace", data)
  end

  def create_private_dns_namespace(name, vpc, opts \\ []) do
    data = %{
      Name: name,
      Vpc: vpc,
      Description: opts |> Keyword.get(:description, ""),
      CreatorRequestId: opts |> Keyword.get(:creator_request_id, "")
    }
    request("CreatePrivateDnsNamespace", data)
  end

  def create_public_dns_namespace(name, opts \\ []) do
    data = %{
      Name: name,
      Description: opts |> Keyword.get(:description, ""),
      CreatorRequestId: opts |> Keyword.get(:creator_request_id, "")
    }
    request("CreatePublicDnsNamespace", data)
  end

  def list_namespaces() do
    request("ListNamespaces", %{})
  end

  def list_services() do
    request("ListServices", %{})
  end

  def list_instances(service_id) do
    request("ListInstances", %{ ServiceId: service_id})
  end

  def list_operations() do
    request("ListOperations", %{})
  end

  def get_namespace(namespace_id) do
    request("GetNamespace", %{Id: namespace_id})
  end

  def get_service(service_id) do
    request("GetService", %{Id: service_id})
  end

  def get_instance(instance_id, service_id) do
    request("GetInstance", %{ InstanceId: instance_id, ServiceId: service_id})
  end

  def get_operation(operation_id) do
    request("GetOperation", %{OperationId: operation_id})
  end

  def get_instances_health_status(service_id, opts \\ []) do
    data = %{
      ServiceId: service_id,
      Instances: opts |> Keyword.get(:instances, [])
    }
    request("GetInstanceHealthStatus", data)
  end

  def register_instance(service_id, instance_id, attributes, opts \\[]) do
    data = %{
      ServiceId: service_id,
      InstanceId: instance_id,
      Attributes: attributes,
      CreatorRequestId: opts |> Keyword.get(:creator_request_id, "")
    }
    request("RegisterInstance", data)
  end

  def deregister_instance(service_id, instance_id) do
    data = %{
      ServiceId: service_id,
      InstanceId: instance_id,
    }
    request("DeregisterInstance", data)
  end

  def update_instance_custom_health_status(service_id, instance_id, status) do
    data = %{
      ServiceId: service_id,
      InstanceId: instance_id,
      Status: status
    }
    request("UpdateInstanceCustomHealthStatus", data)
  end

  ## Request
  ######################

  defp request(action, data) do
    %ExAws.Operation.JSON{
    http_method: :post,
    headers: [
      {"x-amz-target", "Route53AutoNaming_v20170314.#{action}"},
      {"content-type", "application/x-amz-json-1.1"}
    ],
    path: "/",
    data: data,
    service: :servicediscovery
}
  end

end
