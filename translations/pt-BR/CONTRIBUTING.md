# Contribuindo para AZD Para Iniciantes

Obrigado pelo seu interesse em contribuir para o curso AZD Para Iniciantes! Este documento fornece diretrizes e informações para colaboradores.

## Como Contribuir

### Reportando Problemas

Se você encontrar bugs, erros ou tiver sugestões de melhorias:

1. **Verifique Problemas Existentes**: Pesquise [problemas existentes](https://github.com/microsoft/azd-for-beginners/issues) para evitar duplicatas
2. **Crie um Novo Problema**: Use o template de problema apropriado
3. **Forneça Detalhes**: Inclua passos para reproduzir, comportamento esperado e capturas de tela, se aplicável

### Propondo Alterações

1. **Faça um Fork do Repositório**: Crie seu próprio fork do projeto
2. **Crie uma Branch**: Crie uma branch de funcionalidade para suas alterações
3. **Faça as Alterações**: Siga nossos padrões de codificação e documentação
4. **Teste suas Alterações**: Verifique se todos os links funcionam e o conteúdo é renderizado corretamente
5. **Envie um Pull Request**: Forneça uma descrição clara das suas alterações

### Tipos de Contribuições

Recebemos os seguintes tipos de contribuições:

#### Melhorias de Conteúdo
- Corrigir erros de digitação, gramática e formatação
- Melhorar a clareza da documentação existente
- Atualizar informações desatualizadas
- Adicionar explicações ou contextos faltantes

#### Novos Exemplos
- Adicionar cenários reais de implantação
- Criar novos templates AZD para casos de uso comuns
- Fornecer exemplos de código e exercícios adicionais

#### Suporte à Tradução
- Ajudar a manter traduções existentes
- Melhorar a qualidade das traduções
- Adicionar traduções para novos conteúdos

#### Relatórios de Bugs
- Reportar links quebrados ou exemplos de código incorretos
- Identificar inconsistências na documentação
- Sinalizar problemas de acessibilidade

## Diretrizes de Contribuição

### Padrões de Documentação

- Use linguagem clara e amigável para iniciantes
- Inclua objetivos e resultados de aprendizado
- Forneça instruções passo a passo com resultados esperados
- Adicione links de navegação para conteúdos relacionados
- Use formatação e estilo markdown consistentes

### Exemplos de Código

- Garanta que todos os exemplos de código sejam testados e funcionais
- Inclua comentários explicando conceitos principais
- Siga as melhores práticas do Azure e do AZD
- Forneça o resultado esperado quando aplicável

### Validar Documentação em Inglês

A partir da raiz do repositório, instale os requisitos de desenvolvimento existentes e execute:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

O verificador offline de links checa caminhos Markdown/HTML em inglês, títulos, âncoras explícitas e espaços vazios de links. Ele exclui arquivos gerados `translations/` e `translated_images/`, incluindo links para esses diretórios. Ele não acessa sites externos nem valida implantações Azure. Use `--json <report-path>` para exportar erros e o inventário de URLs externas para uma verificação separada de rede. Verifique comandos a montante atuais e pré-requisitos de exemplo ao modificar instruções técnicas; diferencie aplicações testadas de protótipos de design.

### Mensagens de Commit

Use mensagens de commit claras e descritivas:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Código de Conduta

Por favor, leia e siga nosso [Código de Conduta](CODE_OF_CONDUCT.md) para manter uma comunidade acolhedora e inclusiva.

## Obtendo Ajuda

- **Perguntas**: Pesquise ou abra um [issue no GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Comunidade**: Participe do [Azure Discord](https://discord.gg/microsoft-azure)
- **Documentação**: Revise os [docs do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licença

Ao contribuir para este repositório, você concorda que suas contribuições serão licenciadas sob a [Licença MIT](../../LICENSE).

---

Obrigado por ajudar a tornar AZD Para Iniciantes um recurso de aprendizado melhor para a comunidade!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->