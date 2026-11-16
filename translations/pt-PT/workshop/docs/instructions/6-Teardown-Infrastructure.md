# 6. Desmontar a Infraestrutura

!!! tip "NO FINAL DESTE MÓDULO SERÁ CAPAZ DE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Exercícios Bónus

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

1. Desmontar a infraestrutura é tão simples como:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirme o ambiente selecionado e reveja os recursos a serem eliminados. Isto remove recursos do Azure e pode destruir dados. Mantenha a solicitação de confirmação para este fluxo de aprendizagem. Uma vez concluído verá uma saída semelhante a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifique a eliminação no portal e confira se existem recursos fora do âmbito da implantação. Relatórios de custos e atualizações de quotas podem ter atraso. A configuração local `.azure` permanece a menos que a remova explicitamente.

1. `azd down --purge` solicita adicionalmente a eliminação permanente dos recursos eliminados temporariamente suportados. Utilize-o somente quando a recuperação não for necessária e entender as políticas de retenção/proteção contra purga. Não garante a libertação imediata da quota.

1. Não faça uma nova implantação apenas para verificar a limpeza. Um `azd up` intencional posterior pode recriar os recursos usando as entradas locais restantes, causando custos novamente. Atualizações do modelo normalmente usam alterações de provisão suportadas, não desmontagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->