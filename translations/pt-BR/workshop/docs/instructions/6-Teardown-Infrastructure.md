# 6. Desmontar a Infraestrutura

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Exercícios Bônus

Antes de desmontar o projeto, reserve alguns minutos para fazer uma exploração aberta.

!!! info "Experimente Estas Sugestões de Exploração"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Desprovisionar Infraestrutura

!!! warning "Se você também completou o exercício do agente hospedado GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Desmontar a infraestrutura é tão simples quanto:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirme o ambiente selecionado e revise os recursos a serem removidos. Isso exclui recursos do Azure e pode destruir dados. Mantenha o prompt de confirmação para este fluxo de aprendizado. Quando concluído, você verá uma saída semelhante a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifique a exclusão no portal e confira se existem recursos fora do escopo da implantação. Relatórios de custos e atualizações de cota podem atrasar. A configuração local `.azure` permanece, a menos que você a remova explicitamente.

1. `azd down --purge` solicita adicionalmente a exclusão permanente de recursos soft-delete suportados. Use-o somente quando a recuperação não for necessária e você entender as políticas de retenção/proteção contra purga. Isso não garante liberação imediata de cota.

1. Não reprovisione apenas para verificar a limpeza. Um `azd up` intencional posterior pode recriar recursos usando as entradas locais restantes e novamente gera cobranças. Atualizações de modelo normalmente usam mudanças suportadas de provisionamento, não desmontagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->