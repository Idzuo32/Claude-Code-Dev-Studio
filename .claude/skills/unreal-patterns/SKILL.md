---
name: unreal-patterns
description: Unreal Engine 5 C++ and Blueprint patterns — class hierarchy, replication, Enhanced Input, and UE5 performance practices.
globs: "Source/**/*.cpp,Source/**/*.h,Content/**"
---

# Unreal Engine 5 Patterns

## C++ Class Template
```cpp
#pragma once
#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "MyCharacter.generated.h"

UCLASS(BlueprintType, Blueprintable)
class MYGAME_API AMyCharacter : public ACharacter
{
    GENERATED_BODY()

public:
    AMyCharacter();
    virtual void GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const override;

protected:
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
    TObjectPtr<USkeletalMeshComponent> WeaponMesh;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Stats")
    float MoveSpeed = 600.f;

    UPROPERTY(ReplicatedUsing = OnRep_Health)
    int32 CurrentHealth = 100;

    UFUNCTION()
    void OnRep_Health();

    virtual void BeginPlay() override;
};
```

## Enhanced Input
```cpp
void AMyCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    if (UEnhancedInputComponent* EIC = Cast<UEnhancedInputComponent>(PlayerInputComponent))
    {
        EIC->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyCharacter::Move);
        EIC->BindAction(JumpAction, ETriggerEvent::Started, this, &ACharacter::Jump);
    }
}
```

## Blueprint vs C++ Decision
| C++ | Blueprint |
|-----|-----------|
| Base classes | Visual state machines |
| Performance-critical | Designer-exposed params |
| Complex math | Rapid prototyping |
| Networking | Level scripting |

## Replication Checklist
- [ ] `UPROPERTY(Replicated)` or `ReplicatedUsing=` on property
- [ ] `GetLifetimeReplicatedProps` with `DOREPLIFETIME` macro
- [ ] `bReplicates = true` in constructor
- [ ] Server authority for game-critical state
- [ ] RPCs for client-to-server communication

## Common Pitfalls
- Use TObjectPtr over raw pointers for UObjects
- Soft references for assets not always loaded
- Always cook for target platform before performance testing
