---
dg-publish: true
---
# Random Notes about Java

## lombok

Library to create getters and setters with annotations, therefore keeping the code much smaller.

Example:
```java
package com.algaworks.algalog.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cliente {
  private Long id;
  private String nome;
  private String email;
  private String telefone;
}
```

<!-- for anki -->

TARGET DECK: java

lombok #flashcard 
Library to create getters and setters with annotations.