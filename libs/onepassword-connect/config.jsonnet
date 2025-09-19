local config = import 'jsonnet/config.jsonnet';
local versions = ['2.5.0'];

config.new(
  name='onepassword-connect',
  specs=[
    {
      output: v,
      prefix: '^com\\.onepassword\\..*',
      crds: [
        'https://raw.githubusercontent.com/1Password/connect-helm-charts/refs/tags/connect-%s/charts/connect/crds/onepassworditem-crd.yaml' % v,
      ],
      localName: 'onepassword-connect',
    }
    for v in versions
  ]
)
