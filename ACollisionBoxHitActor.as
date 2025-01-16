//Simple test of an actor with a Collision Box and printing.
class ACollisionBoxHitActor : AActor
{
    // Collision box component
    UPROPERTY(DefaultComponent)
    UBoxComponent CollisionBox;

    // Set default properties for the collision box
    default CollisionBox.BoxExtent = FVector(50.0, 50.0, 50.0);
    default CollisionBox.SetCollisionProfileName(n"BlockAll");

    // BlueprintOverride ensures this method runs when the actor begins play
    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Log("CollisionBoxHitActor Initialized");

        if (IsValid(CollisionBox))
        {
            Log("CollisionBox successfully created.");
            // Bind the collision event 
			CollisionBox.OnComponentHit.AddUFunction(this, n"ComponentHit");
        }
        else
        {
            Log("Failed to create CollisionBox.");
        }
    }
	
    // Event triggered on collision
    UFUNCTION()
    void ComponentHit(UPrimitiveComponent HitComponent, AActor OtherActor, UPrimitiveComponent OtherComp, FVector NormalImpulse, const FHitResult&in Hit)
    {
        Log("Component hit.");
        PrintToScreen("Hello World! The Actor was hit.", 5.0f);
        DestroyActor();
    }
	
}
