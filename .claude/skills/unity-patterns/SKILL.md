---
name: unity-patterns
description: Unity 6.x C# patterns — component architecture, ScriptableObjects, events, object pooling, IEnemyState pattern, and editor scripting.
globs: "**/*.cs,Assets/**"
---

# Unity 6.x Patterns

## Project Structure
```
Assets/
  _Project/
    Scripts/
      Core/        # GameManager, interfaces, state machine
      Player/
      Enemies/
      UI/
      Utilities/
    ScriptableObjects/
    Prefabs/
    Scenes/
  Editor/          # Editor-only scripts
  Plugins/         # Third-party
```

## Component Architecture
Prefer composition over inheritance. Small, single-purpose MonoBehaviours.
```csharp
// Good: focused components
[RequireComponent(typeof(Rigidbody))]
public class PlayerMovement : MonoBehaviour { }
public class PlayerHealth : MonoBehaviour { }

// Bad: one PlayerController with 800 lines
```

## ScriptableObject for Data
```csharp
[CreateAssetMenu(fileName = "EnemyConfig", menuName = "Config/Enemy")]
public class EnemyConfig : ScriptableObject
{
    public float moveSpeed = 3f;
    public int maxHealth = 100;
    public float attackRange = 2f;
}
```

## IEnemyState Pattern
```csharp
public interface IEnemyState
{
    void EnterState(EnemyController enemy);
    void UpdateState(EnemyController enemy);
    void ExitState(EnemyController enemy);
}

public class EnemyController : MonoBehaviour
{
    private IEnemyState _currentState;
    public readonly IdleState IdleState = new();
    public readonly ChaseState ChaseState = new();

    private void Awake() => TransitionTo(IdleState);

    public void TransitionTo(IEnemyState newState)
    {
        _currentState?.ExitState(this);
        _currentState = newState;
        _currentState.EnterState(this);
    }

    private void Update() => _currentState?.UpdateState(this);
}
```

## Object Pooling
```csharp
public class BulletPool : MonoBehaviour
{
    [SerializeField] private GameObject _bulletPrefab;
    private readonly Queue<GameObject> _pool = new();

    public GameObject Get()
    {
        if (_pool.Count > 0) { var b = _pool.Dequeue(); b.SetActive(true); return b; }
        return Instantiate(_bulletPrefab, transform);
    }

    public void Return(GameObject bullet)
    {
        bullet.SetActive(false);
        _pool.Enqueue(bullet);
    }
}
```

## Performance Rules
- Cache GetComponent() in Awake — never in Update
- Never use Find() at runtime
- Profile with Unity Profiler before optimizing

## Unity Asset Store Package Checklist
- [ ] Assembly Definition Files configured
- [ ] Consistent root namespace
- [ ] No scene-dependent code
- [ ] Samples folder separated
- [ ] XML documentation on public API
- [ ] package.json with correct metadata
