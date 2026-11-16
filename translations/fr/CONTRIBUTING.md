# Contribuer à AZD For Beginners

Merci de votre intérêt à contribuer au cours AZD For Beginners ! Ce document fournit des directives et des informations pour les contributeurs.

## Comment contribuer

### Signaler des problèmes

Si vous trouvez des bugs, des erreurs ou avez des suggestions d'amélioration:

1. **Vérifier les issues existantes**: Recherchez [issues existantes](https://github.com/microsoft/azd-for-beginners/issues) pour éviter les doublons
2. **Créer une nouvelle issue**: Utilisez le modèle d'issue approprié
3. **Fournir des détails**: Inclure les étapes pour reproduire, le comportement attendu, et des captures d'écran le cas échéant

### Proposer des modifications

1. **Forker le dépôt**: Créez votre propre fork du projet
2. **Créer une branche**: Créez une branche de fonctionnalité pour vos modifications
3. **Apporter des modifications**: Suivez nos normes de codage et de documentation
4. **Testez vos modifications**: Vérifiez que tous les liens fonctionnent et que le contenu s'affiche correctement
5. **Soumettre une pull request**: Fournissez une description claire de vos modifications

### Types de contributions

Nous accueillons les types de contributions suivants:

#### Améliorations de contenu
- Corriger les fautes de frappe, la grammaire et les problèmes de formatage
- Améliorer la clarté de la documentation existante
- Mettre à jour les informations obsolètes
- Ajouter des explications ou du contexte manquants

#### Nouveaux exemples
- Ajouter des scénarios de déploiement réels
- Créer de nouveaux modèles AZD pour des cas d'utilisation courants
- Fournir des exemples de code et des exercices supplémentaires

#### Support de traduction
- Aider à maintenir les traductions existantes
- Améliorer la qualité des traductions
- Ajouter des traductions pour les nouveaux contenus

#### Rapports de bogues
- Signaler les liens cassés ou les exemples de code incorrects
- Identifier les incohérences de la documentation
- Signaler les problèmes d'accessibilité

## Directives de contribution

### Normes de documentation

- Utilisez un langage clair et adapté aux débutants
- Incluez les objectifs d'apprentissage et les résultats attendus
- Fournissez des instructions étape par étape avec les résultats attendus
- Ajoutez des liens de navigation vers le contenu connexe
- Utilisez un formatage et un style markdown cohérents

### Exemples de code

- Assurez-vous que tous les exemples de code sont testés et fonctionnent
- Incluez des commentaires expliquant les concepts clés
- Suivez les bonnes pratiques Azure et AZD
- Fournissez les résultats attendus lorsque cela est applicable

### Valider la documentation en anglais

Depuis la racine du dépôt, installez les dépendances de développement existantes et exécutez :

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Le vérificateur de liens hors ligne vérifie les chemins Markdown/HTML en anglais, les titres, les ancres explicites et les espaces réservés pour liens vides. Il exclut les `translations/` et `translated_images/` générés, y compris les liens vers ces répertoires. Il ne récupère pas les sites externes ni ne valide les déploiements Azure. Utilisez `--json <report-path>` pour exporter les échecs et l'inventaire des URL externes pour une vérification réseau séparée. Vérifiez les commandes en amont actuelles et les prérequis d'exemples lors de la modification des instructions techniques ; distinguez les applications testées des plans de conception.

### Messages de commit

Utilisez des messages de commit clairs et descriptifs:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Code de conduite

Veuillez lire et respecter notre [Code de conduite](CODE_OF_CONDUCT.md) pour maintenir une communauté accueillante et inclusive.

## Obtenir de l'aide

- **Questions** : Recherchez ou ouvrez un [problème GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Communauté** : Rejoignez le [Discord Azure](https://discord.gg/microsoft-azure)
- **Documentation** : Consultez les [docs Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licence

En contribuant à ce dépôt, vous acceptez que vos contributions soient sous licence [Licence MIT](../../LICENSE).

---

Merci de contribuer à faire d'AZD For Beginners une meilleure ressource d'apprentissage pour la communauté!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->