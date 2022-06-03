package ch1;

public abstract class CachedValue<T> implements Value<T>, Cacheable<T> {
    protected T val;

    @Override
    public final T value() {
        if (val == null)
            val = compute();
        return val;
    }
}
