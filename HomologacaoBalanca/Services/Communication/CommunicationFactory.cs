namespace HomologacaoBalanca.Services.Communication
{
    class CommunicationFactory : ICommunicatonFactory
    {
        private readonly Dictionary<string, ICommunicationService> _services;

        public CommunicationFactory(IEnumerable<ICommunicationService> services)
        {
            _services = services.ToDictionary(s => s.Type.ToLower(), s => s);
        }

        public ICommunicationService Create(string type)
        {
            if (_services.TryGetValue(type.ToLower(), out var service))
                return service;

            throw new NotSupportedException("Tipo de comunicação não suportado");
        }
    }
}
