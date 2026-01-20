local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: '1.14.0', version: '1.14' },
  { tag: '2.12.1', version: '2.12' },
  { tag: '2.14.0', version: '2.14' },
  { tag: '2.15.0', version: '2.15' },
  { tag: '2.16.1', version: '2.16' },
];


config.new(
  name='rabbitmq',
  specs=[
    {
      output: v.version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^com\\.rabbitmq\\..*',
      crds: [
        'https://github.com/rabbitmq/cluster-operator/releases/download/v%s/cluster-operator.yml' % v.tag,
      ],
      localName: 'rabbitmq',
    }
    for v in versions
  ]
)
