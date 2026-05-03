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
    C3 --> H[Audio System]

    E --> F[Display Output<br>Score / Lives / Messages]

    C --> G[Visual Effects]
    G --> F

    %% Audio Flow
    H --> H1[Background Music]
    H --> H2[UI Sound Effects]
    H --> H3[Gameplay SFX<br>Collisions / Events]

    H1 --> F
    H2 --> F
    H3 --> F

    subgraph Engine[Godot Engine]
        B
        C
        E
        G
        H
    end

    subgraph Systems[Core Systems]
        C1
        C2
        C3
    end

    subgraph Audio[Audio Components]
        H1
        H2
        H3
    end

    subgraph Testing[Testing Layer]
        T[GUT Tests]
    end

    T --> C
