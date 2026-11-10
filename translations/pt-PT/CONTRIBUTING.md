# Contribuir para o AZD Para Iniciantes

Obrigado pelo seu interesse em contribuir para o curso AZD Para Iniciantes! Este documento fornece diretrizes e informações para os contribuintes.

## Como Contribuir

### Reportar Problemas

Se encontrar bugs, erros ou tiver sugestões de melhorias:

1. **Verificar Problemas Existentes**: Pesquise [problemas existentes](https://github.com/microsoft/azd-for-beginners/issues) para evitar duplicados
2. **Criar um Novo Problema**: Use o modelo de problema apropriado
3. **Fornecer Detalhes**: Inclua passos para reproduzir, comportamento esperado e capturas de ecrã, se aplicável

### Propor Alterações

1. **Criar um Fork do Repositório**: Crie o seu próprio fork do projeto
2. **Criar um Branch**: Crie um branch para a sua funcionalidade
3. **Fazer Alterações**: Siga os nossos padrões de codificação e documentação
4. **Testar as Suas Alterações**: Verifique se todos os links funcionam e o conteúdo é apresentado corretamente
5. **Submeter um Pull Request**: Forneça uma descrição clara das suas alterações

### Tipos de Contribuições

Acolhemos os seguintes tipos de contribuições:

#### Melhoria de Conteúdo
- Corrigir erros tipográficos, gramaticais e de formatação
- Melhorar a clareza da documentação existente
- Atualizar informações desatualizadas
- Adicionar explicações ou contexto em falta

#### Novos Exemplos
- Adicionar cenários de implantação do mundo real
- Criar novos modelos AZD para casos de uso comuns
- Fornecer exemplos de código adicionais e exercícios

#### Suporte a Traduções
- Ajudar a manter traduções existentes
- Melhorar a qualidade das traduções
- Adicionar traduções para novos conteúdos

#### Reportar Bugs
- Reportar links quebrados ou exemplos de código incorretos
- Identificar inconsistências na documentação
- Assinalar problemas de acessibilidade

## Diretrizes para Contribuições

### Padrões de Documentação

- Usar linguagem clara, amigável para iniciantes
- Incluir objetivos e resultados de aprendizagem
- Fornecer instruções passo a passo com saídas esperadas
- Adicionar links de navegação para conteúdos relacionados
- Usar formatação consistente e estilo markdown

### Exemplos de Código

- Certificar-se de que todos os exemplos de código foram testados e funcionam
- Incluir comentários que expliquem conceitos chave
- Seguir as melhores práticas do Azure e AZD
- Fornecer a saída esperada quando aplicável

### Validar Documentação em Inglês

A partir da raiz do repositório, instale os requisitos de desenvolvimento existentes e execute:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

O verificador de links offline verifica caminhos Markdown/HTML em inglês, cabeçalhos, âncoras explícitas e espaços reservados para links vazios. Exclui `translations/` e `translated_images/` gerados, incluindo links para esses diretórios. Não acede a websites externos nem valida implantações Azure. Use `--json <report-path>` para exportar falhas e o inventário de URLs externos para uma verificação de rede separada. Verifique os comandos upstream atuais e pré-requisitos de amostra ao alterar instruções técnicas; distinga aplicações testadas de projetos de design.

### Mensagens de Commit

Utilize mensagens de commit claras e descritivas:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Código de Conduta

Por favor, leia e siga o nosso [Código de Conduta](CODE_OF_CONDUCT.md) para manter uma comunidade acolhedora e inclusiva.

## Obter Ajuda

- **Perguntas**: Pesquise ou abra um [issue no GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Comunidade**: Junte-se ao [Discord Azure](https://discord.gg/microsoft-azure)
- **Documentação**: Consulte a [documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licença

Ao contribuir para este repositório, concorda que as suas contribuições serão licenciadas sob a [Licença MIT](../../LICENSE).

---

Obrigado por ajudar a tornar o AZD Para Iniciantes um melhor recurso de aprendizagem para a comunidade!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->