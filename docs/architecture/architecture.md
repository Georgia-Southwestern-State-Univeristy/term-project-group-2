## Architecture Diagram

```mermaid
flowchart TD

    A[Player Input<br>Keyboard] --> B[Godot Input System]

    B --> C[Game Logic Layer<br>Main.gd]

    C --> C1[Spawner System]
    C --> C2[Collision System]
    C --> C3[Game State Manager]

    C1 --> D[Objects Spawned<br>GoodDrop / BadDrop]
    D --> C2

    C2 -->|Catch| C3
    C2 -->|Miss| C3

    C3 --> E[UI Layer]

    E --> F[Display Output<br>Score / Lives / Messages]

    C --> G[Visual Effects]
    G --> F

    subgraph Engine[Godot Engine]
        B
        C
        E
        G
    end

    subgraph Systems[Core Systems]
        C1
        C2
        C3
    end

    subgraph Testing[Testing Layer]
        T[GUT Tests]
    end

    T --> C
